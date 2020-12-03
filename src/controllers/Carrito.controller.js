const pool = require("../config/database");
const axios = require("axios");

async function guardarCarrito(req, res) {
  res.setHeader("Content-Type", "application/json");
  console.log(req.connection.remoteAddress);

  const { user, carrito, datosOrden, datosPago, tipoPago } = req.body;
  const { AuthToken } = req;
  let idorden;
  try {
    if (user.idorden) {
      idorden = user.idorden;
    } else {
      const resp = await pool.query(
        "INSERT INTO ordenes(nombrecliente,apellidoscliente,telefonocliente,telefono2cliente,idtipo_documento,documentocliente,direccioncliente,idtipo_pago,idestado_pago)VALUE (?, ?, ?, ?, ?, ?, ?,?,?)",
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
      if (resp.status === 200)
        await pool.query(
          "UPDATE ordenes set finalizada=1, idtipo_pago=4,numeropago=? where id=?",
          [resp.data.transaction.id, idorden]
        );
      res.status(200).send(resp.data.transaction.bank_url);
    } else {
      res.status(200).send({ mensaje: "Orden creada correctamente" });
    }
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
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
      "https://noccapi-stg.globalpay.com.co/order/",
      {
        carrier: {
          id: "PSE",
          extra_params: {
            bank_code: datosPago.banco,
            response_url: "http://localhost:3000/" + idorden,
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
          "https://noccapi-stg.globalpay.com.co/pse/order/" +
            orden[0].numeropago,
          { headers: { "auth-token": AuthToken } }
        );

        if (json.status === 200) {
          //se actualiza el estado del tipo de pago de la orden

          if (json.data.transaction.status === "failure") {
            estado = "RECHAZADO";
            await pool.query("UPDATE ordenes set idestado_pago=3 where id=?", [
              idorden,
            ]);
          } else if (json.data.transaction.status === "approved") {
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
  error,
};
