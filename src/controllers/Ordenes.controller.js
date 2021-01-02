const pool = require("../config/database");

async function crear(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idproveedor, articulos } = req.body;
  const { idusuario } = req;
  const fechacreacion = new Date();

  try {
    let datos = await pool.query("INSERT INTO ordenes_compra SET ?", {
      idproveedor,
      idusuario,
      fechacreacion,
    });

    if (datos.affectedRows > 0) {
      const idorden_compra = datos.insertId;
      articulos.forEach(async (articulo) => {
        datos = await pool.query(
          "INSERT INTO orden_compra_detalles (codigoarticulo,descripcionarticulo," +
            "cantidadarticulo,valorarticulo,ivaarticulo,idtarifaiva,idorden_compra)" +
            "values(?,?,?,?,?,?,?)",
          [
            articulo.codigoarticulo,
            articulo.descripcionarticulo,
            articulo.cantidadarticulo,
            parseFloat(articulo.valorarticulo),
            parseFloat(articulo.ivaarticulo) / articulo.cantidadarticulo,
            articulo.idtarifaiva,
            idorden_compra,
          ]
        );
      });

      if (datos.affectedRows > 0) {
        res
          .status(200)
          .send({ mensaje: "Orden Creada Correctamente No. " + idproveedor });
      }
    } else res.status(201).send({ mensaje: "No Se Actualizo El Campo" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idproveedor, articulos } = req.quey;
  const { idusuario } = req;
  const fechacreacion = new Date();

  try {
    /*  let datos = await pool.query("INSERT INTO ordenes_compra SET ?", {
      idproveedor,
      idusuario,
      fechacreacion,
    });

    if (datos.affectedRows > 0) {
      const idorden_compra = datos.insertId;
      articulos.forEach(async (articulo) => {
        datos = await pool.query(
          "INSERT INTO orden_compra_detalles (codigoarticulo,descripcionarticulo," +
            "cantidadarticulo,valorarticulo,ivaarticulo,idtarifaiva,idorden_compra)" +
            "values(?,?,?,?,?,?,?)",
          [
            articulo.codigoarticulo,
            articulo.descripcionarticulo,
            articulo.cantidadarticulo,
            parseFloat(articulo.valorarticulo),
            parseFloat(articulo.ivaarticulo) / articulo.cantidadarticulo,
            articulo.idtarifaiva,
            idorden_compra,
          ]
        );
      });

      if (datos.affectedRows > 0) {
        res
          .status(200)
          .send({ mensaje: "Orden Creada Correctamente No. " + idproveedor });
      }
    } else res.status(201).send({ mensaje: "No Se Actualizo El Campo" });*/
    res.status(501).send({ mensaje: "Error " + e });
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
  crear,
  consultar,
  error,
};
