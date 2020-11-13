const pool = require("../config/database");
const fs = require("fs").promises;
const fsE = require("fs-extra");

async function consultarBarrios(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM barrios");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultartiposdocumento(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM tipos_documento");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarcarusel(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM carusel");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarrecomendaciones(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM recomendaciones");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultargrupos(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM grupos");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarmarcas(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM marcas");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarsubgrupos(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { idgrupo } = req.params;
  try {
    const datos = await pool.query("SELECT * FROM subgrupos where idgrupo=?", [
      idgrupo,
    ]);

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultartiposdocumento(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM tipos_documento");

    if (datos.length > 0) {
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}
async function eliminarcarusel(req, res) {
  try {
    const { id } = req.params;
    const slider = await pool.query(
      "select img, imgmovil from carusel where id =? ",
      [id]
    );

    const eliminado = await pool.query("delete from carusel where id =?", [id]);
    console.log(eliminado.affectedRows);
    if (eliminado.affectedRows > 0) {
      await fs.unlink("src/public/" + slider[0].img);
      await fs.unlink("src/public/" + slider[0].imgmovil);
    }
  } catch (e) {
    console.log(e);
  }
  res.status(200).send({ mensaje: "ok" });
}

async function subirimg(req, res) {
  const img = req.body.img.path.split("\\");
  res.status(200).send({ img: img[img.length - 1] });
}

async function agregarcarusel(req, res) {
  const { img, imgmovil, idgrupo } = req.body;
  try {
    img1 = "img/carusel/" + img;
    imgmovil1 = "img/carusel/movil/" + imgmovil;
    const add = await pool.query("INSERT INTO carusel set ? ", {
      img: img1,
      imgmovil: imgmovil1,
      idgrupo,
    });

    fsE.move(
      "src/public/temp/" + img,
      "src/public/img/carusel/" + img,
      (err) => {
        if (err) res.status(502).send({ error: err });
        else
          fsE.move(
            "src/public/temp/" + imgmovil,
            "src/public/img/carusel/movil/" + imgmovil,
            (err) => {
              if (err) res.status(502).send({ error: err });
              else res.status(200).send({ mensaje: "ok" });
              return;
            }
          );
        return;
      }
    );
  } catch (e) {
    console.log(e);
  }
}

async function editarcarusel(req, res) {
  const { img, imgmovil, idgrupo, idcarusel } = req.body;
  console.log(req.body);
  try {
    img1 = "img/carusel/" + img;
    imgmovil1 = "img/carusel/movil/" + imgmovil;

    let sql = "UPDATE carusel set img=?, imgmovil=?, idgrupo=? where id=? ";
    let params = [img1, imgmovil1, idgrupo, idcarusel];

    if (img1 === null && imgmovil === null && idgrupo === null) {
      res.status(201).send({ mensaje: "sin cambios a realizar" });
    } else if (img1 === null && imgmovil === null) {
      sql = "UPDATE carusel set img=?, imgmovil=? where id=? ";
      params = [img1, imgmovil1, idcarusel];
    } else if (img1 === null) {
      sql = "UPDATE carusel set img=? where id=? ";
      params = [img1, idcarusel];
    } else if (img1 === null && idgrupo === null) {
      sql = "UPDATE carusel set img=?, idgrupo=? where id=? ";
      params = [img1, idgrupo, idcarusel];
    } else if (idgrupo === null && imgmovil === null) {
      sql = "UPDATE carusel set idgrupo=?, imgmovil=? where id=? ";
      params = [idgrupo, imgmovil1, idcarusel];
    } else if (idgrupo === null) {
      sql = "UPDATE carusel set idgrupo=? where id? ";
      params = [idgrupo, idcarusel];
    }
    const add = await pool.query(sql, params);

    if (img)
      fsE.move(
        "src/public/temp/" + img,
        "src/public/img/carusel/" + img,
        (err) => {
          if (err) res.status(502).send({ error: err });
          else if (imgmovil)
            fsE.move(
              "src/public/temp/" + imgmovil,
              "src/public/img/carusel/movil/" + imgmovil,
              (err) => {
                if (err) res.status(502).send({ error: err });
                else res.status(200).send({ mensaje: "ok" });
                return;
              }
            );
          else res.status(200).send({ mensaje: "ok" });
          return;
        }
      );
    else if (imgmovil)
      fsE.move(
        "src/public/temp/" + imgmovil,
        "src/public/img/carusel/movil/" + imgmovil,
        (err) => {
          if (err) res.status(502).send({ error: err });
          else res.status(200).send({ mensaje: "ok" });
          return;
        }
      );

    res.status(200).send({ mensaje: "ok" });
  } catch (e) {
    console.log(e);
  }
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  consultarcarusel,
  eliminarcarusel,
  consultarrecomendaciones,
  consultargrupos,
  consultarmarcas,
  consultarsubgrupos,
  consultartiposdocumento,
  consultarBarrios,
  editarcarusel,
  agregarcarusel,
  subirimg,
  error,
};
