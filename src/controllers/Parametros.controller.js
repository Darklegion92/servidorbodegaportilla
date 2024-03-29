const pool = require("../config/database");
const fs = require("fs").promises;
const fsE = require("fs-extra");
//const e = require("express");

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

async function consultarEstados(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM estados");

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
      await pool.query(
        "UPDATE parametros set valor = valor+1, fecha=CURDATE() where id = 1"
      );
      res.status(200).send(datos);
    } else res.status(201).send({ mensaje: "No Se Encontraron Resultados" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function consultarcontador(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const datos = await pool.query("SELECT * FROM parametros where id = 1");

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
    const datos = await pool.query("SELECT * FROM grupos order by nombre");

    if (datos.length > 0) {
      console.log("tamaño de datos" + datos.length);
      let data = [];
      datos.forEach(async (grupo, i) => {
        const subgrupos = await pool.query(
          "SELECT * FROM subgrupos where idgrupo = " +
            grupo.id +
            " order by nombre"
        );

        grupo.subgrupos = subgrupos;

        data.push(grupo);
        if (data.length === datos.length) {
          res.status(200).send(data);
        }
      });
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
    const { id, type } = req.params;

    if (type === "movil") {
      await pool.query("update carusel set imgmovil = null where id =?", [id]);
    } else {
      await pool.query("update carusel set img = null where id =?", [id]);
    }
  } catch (e) {
    console.log(e);
  }
  res.status(200).send({ mensaje: "ok" });
}

async function consultarBancosPSE(req, res) {
  res.setHeader("Content-Type", "application/json");

  try {
    const bancos = await pool.query("SELECT * FROM bancospse");
    bancos.shift();
    res.status(200).send(bancos);
  } catch (error) {
    res.status(500).send(error);
    console.log(e);
  }
}

async function subirimg(req, res) {
  const img =
    req?.body?.avatar?.path?.split("/") || req.body?.file?.path?.split("\\");
  res.status(200).send({ img: img[img.length - 1] });
}

async function agregarcarusel(req, res) {
  const { images, imagesMovil, idgrupo } = req.body;
  try {
    await pool.query("delete from carusel");
    const newImages = images.map((img) => img.url);
    const newImagesMovil = imagesMovil.map((img) => img.url);

    if (newImages > newImagesMovil) {
      for (let i = 0; i < newImages.length; i++) {
        const img = newImages[i];
        let imgmovil;
        if (newImagesMovil.length > i) {
          imgmovil = newImagesMovil[i];
          if (typeof imagesMovil[i].id !== "number") {
            await fsE.move(
              "src/public/temp/" + imgmovil,
              "src/public/img/carusel/movil/" + imgmovil
            );
          }
        }
        if (typeof images[i].id !== "number") {
          await fsE.move(
            "src/public/temp/" + img,
            "src/public/img/carusel/" + img
          );
        }

        await pool.query("INSERT INTO carusel set ? ", {
          img,
          imgmovil,
          idgrupo: idgrupo || 1,
        });
      }
    } else {
      for (let i = 0; i < newImagesMovil.length; i++) {
        let img;
        const imgmovil = newImagesMovil[i];
        if (newImages.length > i) {
          img = newImages[i];
          await fsE.move(
            "src/public/temp/" + img,
            "src/public/img/carusel/" + img
          );
        }
        await fsE.move(
          "src/public/temp/" + imgmovil,
          "src/public/img/carusel/movil/" + imgmovil
        );
        await pool.query("INSERT INTO carusel set ? ", {
          img,
          imgmovil,
          idgrupo: 1,
        });
      }
    }
    res.status(200).send({ mensaje: "ok" });
  } catch (e) {
    console.log(e);
  }
}

async function editarcarusel(req, res) {
  const { img, imgmovil, idgrupo, idcarusel } = req.body;
  try {
    img1 = "img/carusel/" + img;
    imgmovil1 = "img/carusel/movil/" + imgmovil;

    let sql = "UPDATE carusel set img=?, imgmovil=?, idgrupo=? where id=? ";
    let params = [img1, imgmovil1, idgrupo, idcarusel];

    if (img === null && imgmovil === null && idgrupo === null) {
      res.status(201).send({ mensaje: "sin cambios a realizar" });
    } else if (img !== null && imgmovil !== null) {
      sql = "UPDATE carusel set img=?, imgmovil=? where id=? ";
      params = [img1, imgmovil1, idcarusel];
    } else if (img !== null) {
      sql = "UPDATE carusel set img=? where id=? ";
      params = [img1, idcarusel];
    } else if (img !== null && idgrupo !== null) {
      sql = "UPDATE carusel set img=?, idgrupo=? where id=? ";
      params = [img1, idgrupo, idcarusel];
    } else if (idgrupo !== null && imgmovil !== null) {
      sql = "UPDATE carusel set idgrupo=?, imgmovil=? where id=? ";
      params = [idgrupo, imgmovil1, idcarusel];
    } else if (idgrupo !== null) {
      sql = "UPDATE carusel set idgrupo=? where id? ";
      params = [idgrupo, idcarusel];
    } else if (imgmovil !== null) {
      sql = "UPDATE carusel set imgmovil=? where id? ";
      params = [imgmovil1, idcarusel];
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
                return;
              }
            );
          return;
        }
      );
    else if (imgmovil)
      fsE.move(
        "src/public/temp/" + imgmovil,
        "src/public/img/carusel/movil/" + imgmovil,
        (err) => {
          if (err) res.status(502).send({ error: err });
          return;
        }
      );

    res.status(200).send({ mensaje: "ok" });
  } catch (e) {
    console.log(e);
  }
}

async function editarrecomendacion(req, res) {
  const { data, img, imgant, id } = req.body;
  const { titulo, texto } = data;
  try {
    let img1 = "img/secciones/" + img;
    let sql = "UPDATE recomendaciones set img=?, titulo=?, texto=? where id=? ";
    let params = [img1, titulo, texto, id];

    if (img === null && titulo === null && texto === null) {
      res.status(201).send({ mensaje: "sin cambios a realizar" });
    } else if (img !== null && titulo !== null) {
      sql = "UPDATE recomendaciones set img=?, titulo=? where id=?  ";
      params = [img1, titulo, id];
    } else if (img !== null) {
      sql = "UPDATE recomendaciones set img=? where id=? ";
      params = [img1, id];
    } else if (img !== null && texto !== null) {
      sql = "UPDATE recomendaciones set img=?, texto=? where id=? ";
      params = [img, texto, id];
    } else if (texto !== null && titulo !== null) {
      console.log("lo hice");
      sql = "UPDATE recomendaciones set texto=?, titulo=? where id=? ";
      params = [texto, titulo, id];
    } else if (texto !== null) {
      sql = "UPDATE recomendaciones set texto=? where id? ";
      params = [texto, id];
    } else if (titulo !== null) {
      sql = "UPDATE recomendaciones set titulo=? where id? ";
      params = [titulo, id];
    }
    await pool.query(sql, params);
    if (img && img !== null) {
      fsE.move(
        "src/public/temp/" + img,
        "src/public/img/secciones/" + img,
        (err) => {
          if (err) {
            console.log(err);
            res.status(502).send({ error: err });
          } else {
            res.status(200).send({ mensaje: "ok" });
            fs.unlink("src/public/" + imgant);
          }
          return;
        }
      );
    } else {
      res.status(200).send({ mensaje: "ok" });
    }
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
  editarrecomendacion,
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
  consultarBancosPSE,
  consultarEstados,
  consultarcontador,
  error,
};
