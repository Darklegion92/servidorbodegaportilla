const pool = require('../config/database')
const Services = require('../services')

async function login (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { email, password } = req.body

  try {
    const datos = await pool.query(
      'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE email =? AND password=?',
      [email, password]
    )
    if (datos.length > 0) {
      const token = Services.createToken(datos)
      const carrito = await pool.query(
        'SELECT codigoarticulo as codigo,preciound as precio, cantidad,nombrearticulo as nombre, embalajearticulo as embalaje, img FROM orden_detalles d WHERE idorden=?',
        [datos[0].idorden]
      )
      res.status(200).send({ token, usuario: datos[0], carrito })
    } else res.status(201).send({ mensaje: 'Usuario o Contraseña Incorrectos' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function loginFacebook (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { email, id, accessToken, name } = req.body
  try {
    const datos = await pool.query(
      'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE email =? AND idfacebook=?',
      [email, id]
    )
    if (datos.length > 0) {
      const token = Services.createToken(datos)
      const carrito = await pool.query(
        'SELECT codigoarticulo as codigo,preciound as precio, cantidad,nombrearticulo as nombre, embalajearticulo as embalaje, img FROM orden_detalles d WHERE idorden=?',
        [datos[0].idorden]
      )
      res.status(200).send({ token, usuario: datos[0], carrito })
    } else {
      const resp = await pool.query(
        'INSERT INTO clientes (emaiL,password,idfacebook,tokenfacebook,nombres,terminos,comunicaciones)values(?,?,?,?,?,?,?)',
        [email, id, id, accessToken, name, true, false]
      )
      if (resp) {
        const datos = await pool.query(
          'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE id =? ',
          [resp.insertId]
        )
        const token = Services.createToken(datos)
        res.status(200).send({ token, usuario: datos[0] })
      }
    }
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function loginGoogle (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const { googleId, accessToken, profileObj } = req.body
  try {
    const datos = await pool.query(
      'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE email =? AND idgoogle=?',
      [profileObj.email, googleId]
    )
    if (datos.length > 0) {
      const token = Services.createToken(datos)
      const carrito = await pool.query(
        'SELECT codigoarticulo as codigo,preciound as precio, cantidad,nombrearticulo as nombre, embalajearticulo as embalaje, img FROM orden_detalles d WHERE idorden=?',
        [datos[0].idorden]
      )
      res.status(200).send({ token, usuario: datos[0], carrito })
    } else {
      const resp = await pool.query(
        'INSERT INTO clientes (emaiL,password,idgoogle,tokengoogle,nombres,terminos,comunicaciones)values(?,?,?,?,?,?,?)',
        [
          profileObj.email,
          googleId,
          googleId,
          accessToken,
          profileObj.name,
          true,
          false
        ]
      )
      if (resp) {
        const datos = await pool.query(
          'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE id =? ',
          [resp.insertId]
        )
        const token = Services.createToken(datos)
        res.status(200).send({ token, usuario: datos[0] })
      }
    }
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function registro (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const {
    email,
    password,
    nombres,
    apellidos,
    celular,
    terminos,
    comunicaciones
  } = req.body

  try {
    const resp = await pool.query(
      'INSERT INTO clientes (emaiL,password,nombres,apellidos,celular,terminos,comunicaciones)values(?,?,?,?,?,?,?)',
      [email, password, nombres, apellidos, celular, terminos, comunicaciones]
    )
    if (resp) {
      const datos = await pool.query(
        'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE id =? ',
        [resp.insertId]
      )
      const token = Services.createToken(datos)
      res.status(200).send({ token, usuario: datos[0] })
    } else res.status(201).send({ mensaje: 'Usuario o Contraseña Incorrectos' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function actualizar (req, res) {
  res.setHeader('Content-Type', 'application/json')
  const {
    nombres,
    apellidos,
    celular,
    otrocelular,
    direccion,
    tipodocumento,
    idusuario
  } = req.body

  try {
    const resp = await pool.query(
      'UPDATE clientes SET nombres=?,apellidos=?,celular=?,celular2=?,direccion=?,idtipo_documento=?, WHERE id=?',
      [
        nombres,
        apellidos,
        celular,
        otrocelular,
        direccion,
        tipodocumento,
        idusuario
      ]
    )
    if (resp) {
     
      res.status(200).send({ message:"Usuario Actualizado Correctamente" })
    } else res.status(201).send({ mensaje: 'Usuario o Contraseña Incorrectos' })
  } catch (e) {
    res.status(501).send({ mensaje: 'Error ' + e })
    console.log(e)
  }
}

async function validarToken (req, res) {
  const { idusuario } = req

  try {
    const datos = await pool.query(
      'SELECT id,documento,idtipo_documento,nombres,apellidos,celular,celular2,direccion,idbarrio,idorden,email,terminos,comunicaciones FROM clientes WHERE id=?',
      [idusuario]
    )
    if (datos.length > 0) {
      const carrito = await pool.query(
        'SELECT codigoarticulo as codigo,preciound as precio, cantidad,nombrearticulo as nombre, embalajearticulo as embalaje, img FROM orden_detalles d WHERE idorden=?',
        [datos[0].idorden]
      )
      res.status(200).send({ usuario: datos[0], carrito })
    } else res.status(201).send({ mensaje: 'Usuario o Contraseña Incorrectos' })
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
  login,
  loginFacebook,
  loginGoogle,
  registro,
  validarToken,
  actualizar,
  error
}
