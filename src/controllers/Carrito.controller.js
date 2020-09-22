const pool = require("../config/database");

async function guardar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const {
    idcliente,
    codigoarticulo,
    preciound,
    cantidad,
    nombrearticulo,
    embalajearticulo,
  } = req.body;

  try {
    await pool.query("CALL nueva_orden(?,?,?,?,?,?)", [
      idcliente,
      codigoarticulo,
      preciound,
      cantidad,
      nombrearticulo,
      embalajearticulo,
    ]);

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
        res
          .status(201)
          .send({ mensaje: "Error de seguridad", resp: false });
      }
    });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e, resp: false });
    console.log(e);
  }
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  guardar,
  validar,
  error,
};
