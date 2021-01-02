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

async function registrar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { codigo, cantidad } = req.body;

  try {
    let sql = "INSERT INTO cupones(codigo,descuento,fechaCreacion)value(?,?,?)";
    let params = [codigo, cantidad, new Date()];

    const datos = await pool.query(sql, params);

    if (datos.affectedRows > 0) {
      res.status(200).send({ res: "creado correctamente" });
    } else res.status(201).send({ mensaje: "Cupon Repetido" });
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
  registrar,
  error,
};
