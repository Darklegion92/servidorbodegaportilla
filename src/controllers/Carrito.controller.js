const pool = require("../config/database");
const { pasarela } = require("../config/keys");
const axios = require("axios");
const { sentMail } = require("../services/sentMail");

async function guardarCarrito(req, res) {
  res.setHeader("Content-Type", "application/json");

  const { user, carrito, datosOrden, datosPago, tipoPago } = req.body;
  const { AuthToken, AuthTokenClient } = req;
  let idorden;
  try {
    if (user.idorden) {
      idorden = user.idorden;
    } else {
      const resp = await pool.query(
        "INSERT INTO ordenes(nombrecliente,apellidoscliente,telefonocliente,telefono2cliente,idtipo_documento,documentocliente,direccioncliente,idtipo_pago,idestado_pago,fecha)VALUE (?, ?, ?, ?, ?, ?, ?,?,?,CURDATE())",
        [
          datosOrden.nombres,
          datosOrden.apellidos,
          datosOrden.celular,
          datosOrden.otrocelular,
          parseInt(datosOrden.tipodocumento),
          datosOrden.documento,
          datosOrden.direccion,
          1,
          1,
        ]
      );
      idorden = resp.insertId;
    }
    let props = "";
    let total = 0;
    await carrito.forEach((articulo) => {
      props =
        props +
        "('" +
        articulo.codigo +
        "'," +
        articulo.precio +
        "," +
        articulo.cantidad +
        ",'" +
        articulo.nombre +
        "','" +
        articulo.embalaje +
        "'," +
        idorden +
        ",'" +
        articulo.img +
        "'),";
      total = total + articulo.cantidad * articulo.precio;
    });
    let props1 = props.substr(0, props.length - 1);
    props1 = props1 + ";";
    await pool.query(
      "INSERT INTO orden_detalles(codigoarticulo,preciound,cantidad,nombrearticulo,embalajearticulo,idorden,img)values" +
        props1
    );

    //Enviar correo por transaccion realizada

    sentMail({
      message: `Se ha registrado un pedido a nombre de ${datosOrden.nombres} ${datosOrden.apellidos} por valor $ ${total}`,
      subject: "Nuevo pedido registrdo",
    });

    ///aca va funcion para crear en GLOBALPAY
    let resp;
    if (tipoPago === "debito") {
      resp = await pagoPSE(
        datosPago,
        AuthToken,
        datosOrden,
        "192.168.1.100",
        total,
        idorden
      );
      if (resp?.status === 200) {
        await pool.query(
          "UPDATE ordenes set finalizada=1, idtipo_pago=4,numeropago=?,fecha=CURDATE() where id=?",
          [resp.data.transaction.id, idorden]
        );
        await pool.query("UPDATE clientes set idorden=null where id=?", [
          user.id,
        ]);
        res.status(200).send({ url: resp.data.transaction.bank_url });
      } else {
        res.status(201).send({ mensaje: "Error" });
      }
    } else if (tipoPago === "efecty") {
      resp = await pagoEfectivo(AuthToken, total);
      if (resp?.status === 200)
        await pool.query(
          "UPDATE ordenes set finalizada=1, idtipo_pago=2,numeropago=?,fecha=CURDATE() where id=?",
          [resp.data.transaction.id, idorden]
        );
      await pool.query("UPDATE clientes set idorden=null where id=?", [
        user.id,
      ]);
      res.status(200).send({
        url: "/pagoefectivo",
        datos: resp.data,
        orden: datosOrden,
      });
    } else if (tipoPago === "credito") {
      resp = await pagoCredito(AuthToken, AuthTokenClient, datosPago, total);
      if (resp?.status === 200) {
        await pool.query(
          "UPDATE ordenes set finalizada=1, idtipo_pago=3,numeropago=?,fecha=CURDATE() where id=?",
          [resp.data.transaction.id, idorden]
        );
        await pool.query("UPDATE clientes set idorden=null where id=?", [
          user.id,
        ]);
        res.status(200).send({
          url: "/pagocredito",
          datos: resp.data,
          orden: datosOrden,
        });
      }
    } else {
      res.status(201).send({
        Error: resp,
      });
    }
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    // console.log(e);
  }
}

async function consultarTodas(req, res) {
  res.setHeader("Content-Type", "application/json");

  const { estado, fechas } = req.query;
  const date = fechas && JSON.parse(fechas);

  let sql =
    "select o.*,ep.nombre as estadopago,concat(nombrecliente,apellidoscliente) as cliente, e.nombre as estado " +
    "from ordenes o,estados_pago ep,estados e where o.idestado_pago = ep.id and e.id=o.idestado and finalizada=1 order by id desc";
  let params = [];
  try {
    if (estado && date && date.date != null) {
      sql =
        "select o.*,ep.nombre as estadopago,concat(nombrecliente,apellidoscliente) as cliente, e.nombre as estado " +
        "from ordenes o,estados_pago ep,estados e where o.idestado_pago = ep.id and e.id=o.idestado and finalizada=1 and o.idestado = ? and fecha>=? and fecha<=?" +
        " order by id desc";
      params = [estado, date.dateString[0], date.dateString[1]];
    } else if (estado) {
      sql =
        "select o.*,ep.nombre as estadopago,concat(nombrecliente,apellidoscliente) as cliente, e.nombre as estado " +
        "from ordenes o,estados_pago ep,estados e where o.idestado_pago = ep.id and e.id=o.idestado and finalizada=1 and o.idestado = ?" +
        " order by id desc";
      params = [estado];
    } else if (date && date.date != null) {
      sql =
        "select o.*,ep.nombre as estadopago,concat(nombrecliente,apellidoscliente) as cliente, e.nombre as estado " +
        "from ordenes o,estados_pago ep,estados e where o.idestado_pago = ep.id and e.id=o.idestado and finalizada=1 and fecha>=? and fecha<=?" +
        " order by id desc";
      params = [date.dateString[0], date.dateString[1]];
    }

    const resp = await pool.query(sql, params);
    if (resp.length > 0) {
      let ordenes = resp;
      await resp.forEach(async (orden, i) => {
        const orden_detalle = await pool.query(
          "select * from orden_detalles where idorden = ?",
          [orden.id]
        );
        if (orden_detalle.length > 0) {
          ordenes[i].detalles = orden_detalle;
        }

        if (resp.length === i + 1) {
          res.status(200).send(ordenes);
        }
      });
    } else {
      res.status(201).send({ message: "sin datos" });
    }
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function pagoEfectivo(AuthToken, total) {
  try {
    const resp = await axios.post(
      pasarela.URL + "order/",
      {
        carrier: {
          id: "payvalida",
        },
        user: {
          id: "soltec",
          email: "soltec_cucuta@hotmail.com",
        },
        order: {
          country: "COL",
          currency: "COP",
          dev_reference: "prueba_stg_2",
          amount: total,
          expiration_days: 5,
          recurrent: false,
          description: "Esto es una prueba desde rest client",
        },
      },
      { headers: { "auth-token": AuthToken } }
    );
    return resp;
  } catch (e) {
    console.log("Error", e);
  }
}

async function pagoPSE(
  datosPago,
  AuthToken,
  { nombres, apellidos, documento },
  ip,
  total,
  idorden
) {
  try {
    const resp = await axios.post(
      pasarela.URL + "order/",
      {
        carrier: {
          id: "PSE",
          extra_params: {
            bank_code: datosPago.banco,
            //response_url: 'https://bodegaportilla.vercel.app/orden/' + idorden,
            response_url: "https://bodegaportilla.com/orden/" + idorden,
            user: {
              name: nombres + " " + apellidos,
              fiscal_number: documento,
              type: "N",
              type_fis_number: datosPago.tipo_doc,
              ip_address: ip,
            },
          },
        },
        user: {
          id: "soltec",
          email: "soltec_cucuta@hotmail.com",
        },
        order: {
          country: "COL",
          currency: "COP",
          dev_reference: "Compra Insumos Bodega Portilla",
          amount: total,
          vat: 0,
          description: "Compras SOLTEC - PORTILLA",
        },
      },
      { headers: { "auth-token": AuthToken } }
    );
    return resp;
  } catch (e) {
    console.log(e);
  }
}

async function pagoCredito(AuthToken, AuthTokenClient, datos, total) {
  //let jsonInscribir
  try {
    //inscribir tarjeta

    //averiguar tarjeta

    let tipo;
    if (datos.numero.substr(0, 1) == 3) {
      tipo = "ax";
    } else if (datos.numero.substr(0, 1) == 4) {
      tipo = "vi";
    } else if (datos.numero.substr(0, 1) == 5) {
      tipo = "mc";
    } else if (datos.numero.substr(0, 1) == 6) {
      tipo = "dc";
    } else {
      res.status(403).send({ mensaje: "medio de pago no soprtado" });
    }

    const fecha = new Date(datos.fecha);
    const jsonInscribir = await axios.post(
      pasarela.URL_CREDIT + "v2/card/add",
      {
        user: {
          id: "1",

          email: "ssierra.ext@rbm.com.co",
        },
        card: {
          number: datos.numero,

          holder_name: datos.nombre,

          expiry_month: fecha.getMonth() + 1,

          expiry_year: fecha.getFullYear(),

          cvc: datos.cvv,

          type: tipo,
        },
      },

      { headers: { "auth-token": AuthTokenClient } }
    );
    if (jsonInscribir.status === 200) {
      const jsonPagar = await axios.post(
        pasarela.URL_CREDIT + "v2/transaction/debit/",
        {
          user: {
            id: "1",

            email: "ssierra.ext@rbm.com.co",
          },
          order: {
            amount: total,
            description: "Pago Compras Bodega Portilla",
            dev_reference: "Bodega Portilla",
            vat: 0.0,
          },
          card: {
            token: jsonInscribir.data.card.token,
          },
        },

        { headers: { "auth-token": AuthToken } }
      );
      if (jsonPagar.status === 200) {
        //eliminar tarjeta
        await axios.post(
          pasarela.URL_CREDIT + "v2/card/delete/",
          {
            card: {
              token: jsonInscribir.data.card.token,
            },

            user: {
              id: "1",
            },
          },

          { headers: { "auth-token": AuthToken } }
        );
        return jsonPagar;
      }
    } else {
      return "Error al procesar la tarjeta";
    }
  } catch (e) {
    console.log(e);
    try {
      const tarjetas = await axios.get(
        pasarela.URL_CREDIT + "v2/card/list?uid=1",
        {
          headers: { "auth-token": AuthToken },
        }
      );

      tarjetas.data.cards.forEach(async (tarjeta) => {
        //eliminar tarjeta
        await axios.post(
          pasarela.URL_CREDIT + "v2/card/delete/",
          {
            card: {
              token: tarjeta.token,
            },

            user: {
              id: "1",
            },
          },

          { headers: { "auth-token": AuthToken } }
        );
      });
    } catch (ex) {
      console.log(ex);
    }
  }
}

async function agregarItem(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { item } = req.body;
  const { idusuario } = req;
  try {
    const cliente = await pool.query(
      "SELECT idorden from clientes where id=?",
      [idusuario]
    );

    if (cliente[0].idorden) {
      const resp = await pool.query(
        "INSERT INTO orden_detalles (codigoarticulo, preciound, cantidad, nombrearticulo, embalajearticulo, idorden, img) " +
          "VALUES (?, ?, ?, ?, ?, ?, ?);",
        [
          item.codigo,
          item.precio,
          item.cantidad,
          item.nombre,
          item.embalaje,
          cliente[0].idorden,
          item.img,
        ]
      );
      if (resp.insertId > 0)
        res.status(200).send({ mensaje: "detalle guardado correctamente" });
    } else {
      orden = await pool.query("INSERT INTO ordenes(idcliente)values(?)", [
        idusuario,
      ]);
      if (orden.insertId > 0) {
        const resp = await pool.query(
          "INSERT INTO orden_detalles (codigoarticulo, preciound, cantidad, nombrearticulo, embalajearticulo, idorden, img) " +
            "VALUES (?, ?, ?, ?, ?, ?, ?);",
          [
            item.codigo,
            item.precio,
            item.cantidad,
            item.nombre,
            item.embalaje,
            orden.insertId,
            item.img,
          ]
        );
        if (resp.insertId > 0)
          res.status(200).send({ mensaje: "detalle guardado correctamente" });
      }
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ mensaje: e });
  }

  //
}

async function eliminarItem(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { item } = req.body;
  const { idusuario } = req;
  try {
    const cliente = await pool.query(
      "SELECT idorden from clientes where id=?",
      [idusuario]
    );

    if (cliente[0].idorden) {
      await pool.query(
        "DELETE FROM orden_detalles where codigoarticulo = ? AND idorden = ?",
        [item.codigo, cliente[0].idorden]
      );

      res.status(200).send({ mensaje: "detalle eliminado correctamente" });
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ mensaje: e });
  }
}

async function editarItem(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { item } = req.body;
  const { idusuario } = req;
  try {
    const cliente = await pool.query(
      "SELECT idorden from clientes where id=?",
      [idusuario]
    );

    if (cliente[0].idorden) {
      await pool.query(
        "UPDATE orden_detalles set cantidad = ? WHERE idorden = ? AND codigoarticulo=? ",
        [item.cantidad, cliente[0].idorden, item.codigo]
      );
      res.status(200).send({ mensaje: "detalle guardado correctamente" });
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ mensaje: e });
  }
}

async function consultar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idorden } = req.params;
  const { AuthToken } = req;
  try {
    const orden = await pool.query("SELECT * from ordenes where id=?", [
      idorden,
    ]);

    if (orden.length > 0) {
      let estado = "PENDIENTE";
      if (orden.idestado_pago !== 1) {
        const json = await axios.get(
          pasarela.URL + "pse/order/" + orden[0].numeropago,
          { headers: { "auth-token": AuthToken } }
        );

        if (json.status === 200) {
          //se actualiza el estado del tipo de pago de la orden

          if (json.data.transaction.status === "failure") {
            const message = `El pago para del pedido ${idorden} por valor de ${orden[0].total} fue RECHAZADO y su pedido CANCELADO No. Transacción ${orden[0].numeropago}`;
            const subject = `Transacción No. ${orden[0].numeropago} ha sido RECHAZADA`;
            sentMail({ message, subject });
            estado = "RECHAZADO";
            await pool.query("UPDATE ordenes set idestado_pago=3 where id=?", [
              idorden,
            ]);
          } else if (json.data.transaction.status === "approved") {
            const message = `El pago para del pedido ${idorden} por valor de ${orden[0].total} fue APROBADO y su pedido pedido esta siendo preparado No. Transacción ${orden[0].numeropago}`;
            const subject = `Transacción No. ${orden[0].numeropago} ha sido APROBADA`;
            sentMail({ message, subject });
            estado = "APROBADO";
            await pool.query("UPDATE ordenes set idestado_pago=2 where id=?", [
              idorden,
            ]);
          } else {
            estado = "PENDIENTE";
          }
        } else {
          res.status(501).send({ error: "error en servidor GlobalPay" });
        }
      }

      console.log(orden);
      res.status(200).send({
        nombre: orden[0].nombrecliente + " " + orden[0].apellidoscliente,
        valor: orden[0].total,
        estado: estado,
        direccion: orden[0].direccioncliente,
      });
    } else {
      res.status(201).send({ mensaje: "error" });
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ mensaje: e });
  }
}

async function actualizarEstado(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idorden, state } = req.body;
  try {
    const orden = await pool.query("UPDATE ordenes set idestado=? where id=?", [
      state,
      idorden,
    ]);

    if (orden.affectedRows > 0) {
      res.status(200).send({ messaje: "actualizado correcto" });
    } else {
      res.status(201).send({ messaje: "orden no encontrada" });
    }
  } catch (e) {
    console.log(e);
    res.status(500).send({ mensaje: e });
  }
}

async function eliminar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { id } = req.params;
  try {
    console.log(id);
    await pool.query("delete from orden_detalles where idorden=?", [id]);
    await pool.query("delete from ordenes where id=?", [id]);
    res.status(200).send({ mensaje: "ok" });
  } catch (error) {
    res.status(500).send(error);
  }
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  agregarItem,
  eliminarItem,
  editarItem,
  consultar,
  guardarCarrito,
  actualizarEstado,
  consultarTodas,
  eliminar,
  error,
};
