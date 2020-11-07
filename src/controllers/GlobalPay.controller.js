const axios = require('axios')

async function obtenerBancos (req, res) {
  console.log(req.AuthToken)
  const { AuthToken } = req
  try {
    const bancos = await axios.get(
      'https://noccapi-stg.globalpay.com.co/banks/PSE/',
      { headers: { 'auth-token': AuthToken } }
    )
    res.status(200).send(bancos.data)
  } catch (e) {
    res.status(500).send(e)
  }
}

function error (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
}

module.exports = {
  obtenerBancos,
  error
}
