const pool = require('../config/database')

async function consultarCategoria (req, res) {
  res.setHeader('Content-Type', 'application/json')
  try {
    let sql =
      "select * from articulos where categoria !='NORMAL' ORDER BY articulos.rank"

    const datos = await pool.query(sql)

    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultar (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { idgrupo, idsubgrupo, idmarca, orden, nombre } = req.query
  let order = "'articulos.rank'"
  let name = ''
  console.log(orden)
  if (orden) {
    order = 'articulos.' + orden + ',articulos.rank'
  }
  if (nombre) {
    name = nombre
  }
  try {
    let sql = 'select * from articulos where nombre LIKE ? ORDER BY ' + order
    let params = ['%' + name + '%', order]
    if (idgrupo && idsubgrupo && idmarca) {
      sql =
        'select * from articulos where nombre LIKE ? AND idgrupo=? and idsubgrupo=? and idmarca=? ORDER BY ' +
        order
      params = ['%' + name + '%', idgrupo, idsubgrupo, idmarca]
    } else if (idgrupo && idmarca) {
      sql =
        'select * from articulos where nombre LIKE ? AND idgrupo=?and idmarca=? ORDER BY ' +
        order
      params = ['%' + name + '%', idgrupo, idmarca]
    } else if (idgrupo && idsubgrupo) {
      sql =
        'select * from articulos where nombre LIKE ? AND idgrupo=? and idsubgrupo=? ORDER BY ' +
        order
      params = ['%' + name + '%', idgrupo, idsubgrupo]
    } else if (idgrupo) {
      sql =
        'select * from articulos where nombre LIKE ? AND idgrupo=? ORDER BY ' +
        order
      params = ['%' + name + '%', idgrupo]
    } else if (idmarca) {
      sql =
        'select * from articulos where nombre LIKE ? AND idmarca=? ORDER BY ' +
        order
      params = ['%' + name + '%', idmarca]
    }
    const datos = await pool.query(sql, params)
    // console.log(datos);
    if (datos.length > 0) {
      res.status(200).send(datos)
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function consultarCodigo (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { codigo } = req.query
  console.log(codigo)
  try {
    const datos = await pool.query('select * from articulos where codigo = ?', [
      codigo
    ])
    if (datos.length > 0) {
      res.status(200).send(datos[0])
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function editar (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { articulo, img } = req.body
  if (img) articulo.img = 'img/articulos/' + img

  if (articulo.embalaje === 'Gr') {
    articulo.precio = articulo.precio / 1000
  }
  try {
    const datos = await pool.query('UPDATE articulos SET ? WHERE codigo=?', [
      articulo,
      articulo.codigo
    ])
    console.log(datos)
    if (datos.length > 0) {
      res.status(201).send({ msj: 'Nada' })
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function crear (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { articulo, img } = req.body
  // let newArticulo = articulo
  if (img) articulo.img = img
  console.log(articulo)
  console.log(req.body)

  try {
    const datos = await pool.query('UPDATE articulos SET ?', [codigo])
    if (datos.length > 0) {
      res.status(201).send({ msj: 'Nada' })
    } else res.status(201).send({ mensaje: 'No Se Encontraron Resultados' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

function error (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
}

module.exports = {
  consultar,
  consultarCategoria,
  editar,
  crear,
  consultarCodigo,
  error
}
