const pool = require("../config/database");

async function validar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { codigo } = req.params;
  const fecha = new Date();
  try {
    let sql = "select * from cupones where codigo = ? AND fechavencimiento>= ?";
    let params = [codigo, fecha];

    const datos = await pool.query(sql, params);
   
    if (datos.length > 0) {
      res.status(200).send(datos[0]);
    } else res.status(201).send({ mensaje: "Cupon no existe o no es valido" });
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
  validar,
  error,
};
