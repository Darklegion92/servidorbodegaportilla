const pool = require("../config/database");
const fs = require("fs").promises;
const fsE = require("fs-extra");

async function consultarCategoria(req, res) {
  res.setHeader("Content-Type", "application/json");
  try {
    let sql =
      "select a.*, s.descuento as descuento from articulos a, subgrupos s where a.idsubgrupo = s.id and categoria !='NORMAL' and estado=1 ORDER BY a.rank desc,a.nombre asc";

    const datos = await pool.query(sql);

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idgrupo, idsubgrupo, idmarca, orden, nombre, iscar } = req.query;

  let order = "a.rank desc,a.nombre asc";
  let name = "";
  if (orden) {
    order = "articulos." + orden + ",articulos.rank desc,articulos.nombre asc";
  }
  if (nombre) {
    name = nombre;
  }
  try {
    let sql =
      "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? " +
      (iscar ? "and estado=1" : "") +
      " ORDER BY " +
      order;
    let params = ["%" + name + "%", order];
    if (idgrupo && idsubgrupo && idmarca) {
      sql =
        "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? AND a.idgrupo=? and idsubgrupo=? and idmarca=? " +
        (iscar ? "and estado=1" : "") +
        " ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idsubgrupo, idmarca];
    } else if (idgrupo && idmarca) {
      sql =
        "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? AND a.idgrupo=?and idmarca=? " +
        (iscar ? "and estado=1" : "") +
        " ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idmarca];
    } else if (idgrupo && idsubgrupo) {
      sql =
        "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? AND a.idgrupo=? and idsubgrupo=? " +
        (iscar ? "and estado=1" : "") +
        " ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idsubgrupo];
    } else if (idgrupo) {
      sql =
        "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? AND a.idgrupo=? " +
        (iscar ? "and estado=1" : "") +
        " ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo];
    } else if (idmarca) {
      sql =
        "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and a.nombre LIKE ? AND idmarca=? " +
        (iscar ? "and estado=1" : "") +
        " ORDER BY " +
        order;
      params = ["%" + name + "%", idmarca];
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

async function consultarCodigo(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { codigo } = req.query;
  try {
    const datos = await pool.query(
      "select a.*, s.descuento as descuento from articulos a, subgrupos s where s.id = a.idsubgrupo and codigo = ? order by a.rank desc ,a.nombre asc",
      [codigo]
    );
    if (datos.length > 0) {
      res.status(200).send(datos[0]);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function editar(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { articulo, img } = req.body;
  let imgMysql = "";

  if (img.length > 0) {
    imgMysql = img.reduce(
      (name, image) => name + "|img/articulos/" + image.url,
      ""
    );
    imgMysql = imgMysql.slice(1);
  } else {
    imgMysql = "";
  }

  if (articulo.embalaje === "Gr") {
    articulo.precio = articulo.precio / 1000;
    articulo.dcto1 = articulo.dcto1 / 1000;
    articulo.dcto2 = articulo.dcto2 / 1000;
    articulo.dcto3 = articulo.dcto3 / 1000;
  }

  try {
    const datos = await pool.query("UPDATE articulos SET ? WHERE id=?", [
      { ...articulo, img: imgMysql },
      articulo.id,
    ]);

    if (img.length > 0) {
      if (datos.affectedRows > 0) {
        for (let i = 0; i < img.length; i++) {
          const dato = img[i].url;
          const exist = fsE.existsSync("src/public/temp/" + dato);
          if (exist) {
            fsE.move(
              "src/public/temp/" + dato,
              "src/public/img/articulos/" + dato,
              (err) => {
                if (i === img.length-1) {
                  res.status(200).send({ msg: "articulo correcto" });
                  return;
                }
              }
            );
          } else {
            if (i === img.length-1) {
              res.status(200).send({ msg: "articulo correcto" });
              return;
            }
          }
        }
      } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
    } else {
      res.status(200).send({ msg: "articulo correcto" });
    }
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function crear(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { articulo, img } = req.body;
  if (img && img.length>0) {
    let imgMysql = img.reduce(
      (name, image) => name + "|img/articulos/" + image.url,
      ""
    );
    imgMysql = imgMysql.slice(1);

    articulo.img = imgMysql;
  }

  if (articulo.embalaje === "Gr") {
    articulo.precio = articulo.precio / 1000;
    articulo.cant_dcto1 = articulo.cant_dcto1 / 1000;
    articulo.cant_dcto2 = articulo.cant_dcto2 / 1000;
    articulo.cant_dcto3 = articulo.cant_dcto3 / 1000;
  }
  try {
    const datos = await pool.query(
      "INSERT INTO articulos(codigo,nombre,precio,embalaje,categoria,idgrupo,idsubgrupo,idmarca,clasificacion,`rank`,descripcion,lista,dcto1,cant_dcto1,dcto2,cant_dcto2,dcto3,cant_dcto3,img)value (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
      [
        articulo.codigo,
        articulo.nombre,
        articulo.precio,
        articulo.embalaje,
        articulo.categoria,
        articulo.idgrupo,
        articulo.idsubgrupo,
        articulo.idmarca,
        articulo.clasificacion,
        articulo.rank,
        articulo.descripcion,
        articulo.lista,
        articulo.dcto1,
        articulo.cant_dcto1,
        articulo.dcto2,
        articulo.cant_dcto2,
        articulo.dcto3,
        articulo.cant_dcto3,
        articulo.img,
      ]
    );
    console.log(datos);
    if (datos.affectedRows > 0) {
      if (img && img !== null) {
        for (let i = 0; i < img.length; i++) {
          const dato = img[i].url;
          const exist = fsE.existsSync("src/public/temp/" + dato);
          if (exist) {
            fsE.move(
              "src/public/temp/" + dato,
              "src/public/img/articulos/" + dato,
              (err) => {
                if (i === img.length-1) {
                  res.status(200).send({ msg: "articulo correcto" });
                  return;
                }
              }
            );
          } else {
            if (i === img.length-1) {
              res.status(200).send({ msg: "articulo correcto" });
              return;
            }
          }
        }
      } else res.status(200).send({ msg: "articulo correcto" });
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function eliminarArticulo(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { id } = req.params;
  console.log(id);
  try {
    const datos = await pool.query("DELETE FROM articulos WHERE id=?", [id]);
    if (datos.affectedRows > 0) {
      res.status(200).send({ mensaje: "Eliminado Correctamente" });
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
  }
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  consultar,
  consultarCategoria,
  editar,
  crear,
  consultarCodigo,
  eliminarArticulo,
  error,
};
