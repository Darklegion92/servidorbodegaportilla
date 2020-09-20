const pool = require("../config/database");

async function login(req, res) {
  res.setHeader("Content-Type", "application/json");
  const { usuario, password } = req.body;

  try {
    const datos = await pool.query(
      "SELECT * FROM clientes WHERE email =? AND password=?",
      [usuario, password]
    );

    if (datos.length > 0) {
      const token = Sercices.createToken(datos);
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
  error,
};
