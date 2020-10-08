const pool = require("../config/database");

async function guardarCarrito(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { user, carrito, datosOrden } = req.body;
  let idorden;
  try {
 /*  if(user){
        idorden = user.idorden;
        
    }else{
        const orden = await pool.query("INSERT INTO ordenes(idcliente,total,nombrecliente,apellidoscliente,telefonocliente,telefono2cliente,idtipodocumento,documentocliente,direccioncliente,idbarrio)"+
        "VALUE(?,?,?,?,?,?,?,?,?,?,?)",[])
        idorden = orden.insertId
    }*/

    res.status(200).send({ mensaje: "Orden creada correctamente" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function validar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { carrito } = req.body;
  try {
    await carrito.forEach(async (item, i) => {
      const articulo = await pool.query(
        "select precio,dcto1,dcto2,dcto3 from articulos where ?",
        { codigo: item.codigo }
      );
      if (
        articulo[0].precio === item.precio &&
        articulo[0].dcto1 === item.dcto1 &&
        articulo[0].dcto2 === item.dcto2 &&
        articulo[0].dcto3 === item.dcto2
      ) {
        if (i + 1 === carrito.length) {
          res
            .status(200)
            .send({ mensaje: "Se ha validado la orden", resp: true });
        }
      } else {
        res.status(201).send({ mensaje: "Error de seguridad", resp: false });
      }
    });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e, resp: false });
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

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  agregarItem,
  eliminarItem,
  editarItem,
  guardarCarrito,
  error,
};
