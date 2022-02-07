const pool = require("../config/database");
const fs = require("fs").promises;
const fsE = require("fs-extra");

async function consultarCategoria(req, res) {
  res.setHeader("Content-Type", "application/json");
  try {
    let sql =
      "select * from articulos where categoria !='NORMAL' and estado=1 ORDER BY articulos.rank desc,articulos.nombre asc";

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
  const { idgrupo, idsubgrupo, idmarca, orden, nombre,iscar} = req.query;

  let order = "articulos.rank desc,articulos.nombre asc";
  let name = "";
  if (orden) {
    order = "articulos." + orden + ",articulos.rank desc,articulos.nombre asc";
  }
  if (nombre) {
    name = nombre;
  }
  try {
    let sql = "select * from articulos where nombre LIKE ? "+(iscar?"and estado=1":"")+" ORDER BY " + order;
    let params = ["%" + name + "%", order];
    if (idgrupo && idsubgrupo && idmarca) {
      sql =
        "select * from articulos where nombre LIKE ? AND idgrupo=? and idsubgrupo=? and idmarca=? "+(iscar?"and estado=1":"")+" ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idsubgrupo, idmarca];
    } else if (idgrupo && idmarca) {
      sql =
        "select * from articulos where nombre LIKE ? AND idgrupo=?and idmarca=? "+(iscar?"and estado=1":"")+" ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idmarca];
    } else if (idgrupo && idsubgrupo) {
      sql =
        "select * from articulos where nombre LIKE ? AND idgrupo=? and idsubgrupo=? "+(iscar?"and estado=1":"")+" ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo, idsubgrupo];
    } else if (idgrupo) {
      sql =
        "select * from articulos where nombre LIKE ? AND idgrupo=? "+(iscar?"and estado=1":"")+" ORDER BY " +
        order;
      params = ["%" + name + "%", idgrupo];
    } else if (idmarca) {
      sql =
        "select * from articulos where nombre LIKE ? AND idmarca=? "+(iscar?"and estado=1":"")+" ORDER BY " +
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
    const datos = await pool.query("select * from articulos where codigo = ? order by articulos.rank desc ,articulos.nombre asc", [
      codigo,
    ]);
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
  if (img) {
    articulo.img = img.slice(1)
  }else{
      articulo.img = null
  }

  if (articulo.embalaje === "Gr") {
    articulo.precio = articulo.precio / 1000;
    articulo.dcto1 = articulo.dcto1 / 1000;
    articulo.dcto2 = articulo.dcto2 / 1000;
    articulo.dcto3 = articulo.dcto3 / 1000;
  }
  try {
    const datos = await pool.query("UPDATE articulos SET ? WHERE id=?", [
      articulo,
      articulo.id,
    ]);
    if (datos.affectedRows > 0) {
      const dataImage = img.slice(1).split("|")
      if (dataImage?.length > 0 && dataImage !== null) {
        for(let i=0;i<dataImage.length;i++){
          const dato = dataImage[i]
          const exist = fsE.existsSync("src/public/temp/" + dato)
          console.log(exist);
          if(exist){
            fsE.move(
              "src/public/temp/" + dato,
              "src/public/img/articulos/" + dato,
              (err) => {
                if (err){ 
                  res.status(502).send({ error: err });
                  return;
                } else if(i===dataImage.length){
                  res.status(200).send({ msg: "articulo correcto" });
                }
            })
          }
        }
        res.status(200).send({ msg: "articulo correcto" });
      } else res.status(200).send({ msg: "articulo correcto" });
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function crear(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { articulo, img } = req.body;
  console.log(articulo);
  if (img) {
    articulo.img = "img/articulos/" + img;
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
        fsE.move(
          "src/public/temp/" + img,
          "src/public/img/articulos/" + img,
          (err) => {
            if (err) res.status(502).send({ error: err });
            else {
              res.status(200).send({ msg: "articulo correcto" });
            }
            return;
          }
        );
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
    const datos = await pool.query("DELETE FROM articulos WHERE id=?", [
     id
    ]);
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
