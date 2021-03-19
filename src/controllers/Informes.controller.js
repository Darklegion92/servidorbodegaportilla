const pool = require("../config/database");

async function articulos(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { tipo } = req.params;
  const { idgrupo, idsubgrupo, fechainicial, fechafinal } = req.query;
  const fechaI = new Date(fechainicial);
  const fechaF = new Date(fechafinal);

  try {
    let sql = "";
    let parametros = {};
    if (tipo === "1") {
      if (idgrupo === "0") {
        if (fechainicial && fechafinal) {
          sql =
            "SELECT d.codigoarticulo AS codigo, d.descripcionarticulo AS descripcion, SUM(d.cantidadarticulo) AS cantidad, " +
            "SUM(d.cantidadarticulo*d.valorarticulo) AS valor, g.nombre AS grupo, s.nombre AS subgrupo, m.nombre AS marca, " +
            "f.fechacreacion AS registro " +
            "FROM factura_venta_detalles d, grupos g, subgrupos s, marcas m, articulos a, facturas_venta f " +
            "WHERE f.idfactura_venta = d.idfactura_venta AND  d.codigoarticulo = a.codigo AND g.idgrupo = s.idgrupo AND a.idsubgrupo = s.idsubgrupo " +
            "AND m.idmarca = a.idmarca AND f.fechacreacion>=? AND f.fechacreacion<? GROUP by a.codigo";
          parametros = [
            fechaI.getFullYear() +
              "/" +
              (fechaI.getMonth() + 1) +
              "/" +
              fechaI.getDate() +
              " 00:00:00",

            fechaF.getFullYear() +
              1 +
              "/" +
              (fechaF.getMonth() + 1) +
              "/" +
              fechaF.getDate() +
              " 00:00:00",
          ];
        }
      } else if (idsubgrupo === "0") {
        sql =
          "SELECT d.codigoarticulo AS codigo, d.descripcionarticulo AS descripcion, SUM(d.cantidadarticulo) AS cantidad, " +
          "SUM(d.cantidadarticulo*d.valorarticulo) AS valor, g.nombre AS grupo, s.nombre AS subgrupo, m.nombre AS marca, " +
          "f.fechacreacion AS registro " +
          "FROM factura_venta_detalles d, grupos g, subgrupos s, marcas m, articulos a, facturas_venta f " +
          "WHERE f.idfactura_venta = d.idfactura_venta AND  d.codigoarticulo = a.codigo AND g.idgrupo = s.idgrupo AND a.idsubgrupo = s.idsubgrupo " +
          "AND m.idmarca = a.idmarca AND f.fechacreacion>=? AND f.fechacreacion<? AND g.idgrupo=? GROUP by a.codigo";
        parametros = [
          fechaI.getFullYear() +
            "/" +
            (fechaI.getMonth() + 1) +
            "/" +
            fechaI.getDate() +
            " 00:00:00",

          fechaF.getFullYear() +
            1 +
            "/" +
            (fechaF.getMonth() + 1) +
            "/" +
            fechaF.getDate() +
            " 00:00:00",
          idgrupo,
        ];
      } else {
        sql =
          "SELECT d.codigoarticulo AS codigo, d.descripcionarticulo AS descripcion, SUM(d.cantidadarticulo) AS cantidad, " +
          "SUM(d.cantidadarticulo*d.valorarticulo) AS valor, g.nombre AS grupo, s.nombre AS subgrupo, m.nombre AS marca, " +
          "f.fechacreacion AS registro " +
          "FROM factura_venta_detalles d, grupos g, subgrupos s, marcas m, articulos a, facturas_venta f " +
          "WHERE f.idfactura_venta = d.idfactura_venta AND  d.codigoarticulo = a.codigo AND g.idgrupo = s.idgrupo AND a.idsubgrupo = s.idsubgrupo " +
          "AND m.idmarca = a.idmarca AND f.fechacreacion>=? AND f.fechacreacion<? AND g.idgrupo=? AND s.idsubgrupo=? GROUP by a.codigo"
        parametros = [
          fechaI.getFullYear() +
            "/" +
            (fechaI.getMonth() + 1) +
            "/" +
            fechaI.getDate() +
            " 00:00:00",

          fechaF.getFullYear() +
            1 +
            "/" +
            (fechaF.getMonth() + 1) +
            "/" +
            fechaF.getDate() +
            " 00:00:00",
          idgrupo,
          idsubgrupo,
        ];
      }
    }

    if(tipo === "2"){
      parametros = [
        fechaI.getFullYear() +
          "/" +
          (fechaI.getMonth() + 1) +
          "/" +
          fechaI.getDate() +
          " 00:00:00",
  
        fechaF.getFullYear() +
          1 +
          "/" +
          (fechaF.getMonth() + 1) +
          "/" +
          fechaF.getDate() +
          " 00:00:00",
      ];
    sql = "Select * from contador_historial where fecha>=? and fecha<=?"
    }
    const datos = await pool.query(sql, parametros);

    if (datos) {
      res.status(200).send(datos);
    } else {
      res.status(201).send({ mensaje: "sin datos" });
    }
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
  articulos,
  error,
};
