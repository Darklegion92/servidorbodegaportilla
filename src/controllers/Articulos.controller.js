const pool = require("../config/database");

async function consultar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idgrupo, idsubgrupo, idmarca } = req.query;
  try {
    let sql = "select * from articulos";
    let params = [];
    if (idgrupo && idsubgrupo && idmarca) {
      sql =
        "select * from articulos where idgrupo=? and idsubgrupo=? and idmarca=?";
      params = [idgrupo, idsubgrupo, idmarca];
    } else if (idgrupo && idmarca) {
      sql = "select * from articulos where idgrupo=?and idmarca=?";
      params = [idgrupo, idmarca];
    } else if (idgrupo && idsubgrupo) {
      sql = "select * from articulos where idgrupo=? and idsubgrupo=?";
      params = [idgrupo, idsubgrupo];
    } else if (idgrupo) {
      sql = "select * from articulos where idgrupo=?";
      params = [idgrupo];
    } else if (idmarca) {
      sql = "select * from articulos where idmarca=?";
      params = [idmarca];
    }
    const datos = await pool.query(sql, params);

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarNombre(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { nombre } = req.params;
  try {
    let sql = "select * from articulos where nombre like ?";

    const datos = await pool.query(sql, ["%" + nombre + "%"]);

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
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
  consultar,
  consultarNombre,
  error,
};
