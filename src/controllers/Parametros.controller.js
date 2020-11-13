const pool = require('../config/database')
const fs = require('fs').promises
var FileReader = require('filereader')

async function consultarBarrios (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM barrios')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultartiposdocumento (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM tipos_documento')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultarcarusel (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM carusel')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultarrecomendaciones (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM recomendaciones')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultargrupos (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM grupos')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultarmarcas (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM marcas')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultarsubgrupos (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { idgrupo } = req.params
  try {
    const datos = await pool.query('SELECT * FROM subgrupos where idgrupo=?', [
      idgrupo
    ])

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultartiposdocumento (req, res) {
  res.setHeader('Content-Type', 'application/json')

  try {
    const datos = await pool.query('SELECT * FROM tipos_documento')

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}
async function eliminarcarusel (req, res) {
  try {
    const { id } = req.params
    const slider = await pool.query(
      'select img, imgmovil from carusel where id =? ',
      [id]
    )

    const eliminado = await pool.query('delete from carusel where id =?', [id])
    console.log(eliminado.affectedRows)
    if (eliminado.affectedRows > 0) {
      await fs.unlink('src/public/' + slider[0].img)
      await fs.unlink('src/public/' + slider[0].imgmovil)
    }
  } catch (e) {
    console.log(e)
  }
  res.status(200).send({ mensaje: 'ok' })
}

async function agregarcarusel (req, res) {
  console.log(req.body.image)
  var buffer = Buffer.from(req.body.image, 'base64')
  fs.writeFile(__dirname + '/public.png', req.body.image, function (err) {
    res.send('success')
  })
  res.status(200).send({ mensaje: 'ok' })
}

function error (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
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
  agregarcarusel,
  error
}
