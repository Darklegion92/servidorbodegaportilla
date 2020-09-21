const pool = require("../config/database");
const Services = require("../services");

async function login(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { usuario, password } = req.query;

  try {
    const datos = await pool.query(
      "SELECT * FROM clientes WHERE email =? AND password=?",
      [usuario, password]
    );

    if (datos.length > 0) {
      const token = Services.createToken(datos);
      const carrito = await pool.query("SELECT * FROM orden_detalles d WHERE idorden=?", [
        datos[0].idorden,
      ]);
      res.status(200).send({ token, usuario: datos[0], carrito });
    } else
      res.status(201).send({ mensaje: "Usuario o Contraseña Incorrectos" });
  } catch (e) {
    res.status(501).send({ mensaje: "Error " + e });
    console.log(e);
  }
}

async function registro(req, res) {
  res.setHeader("Content-Type", "application/json");
  const {
    email,
    password,
    nombres,
    apellidos,
    celular,
    terminos,
    comunicaciones,
  } = req.body;

  try {
    const resp = await pool.query(
      "INSERT INTO clientes (emaiL,password,nombres,apellidos,celular,terminos,comunicaciones)values(?,?,?,?,?,?,?)",
      [email, password, nombres, apellidos, celular, terminos, comunicaciones]
    );
    if (resp) {
      const datos = await pool.query("SELECT * FROM clientes WHERE id =? ", [
        resp.insertId,
      ]);
      const token = Services.createToken(datos);
      res.status(200).send({ token, usuario: datos[0] });
    } else
      res.status(201).send({ mensaje: "Usuario o Contraseña Incorrectos" });
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
  login,
  registro,
  error,
};
