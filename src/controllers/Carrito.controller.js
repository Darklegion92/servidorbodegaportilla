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

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  guardar,
  error,
};
