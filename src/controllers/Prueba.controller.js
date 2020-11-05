const axios = require('axios')

async function obtenerBancos (req, res) {
  console.log(req.AuthToken)
  const { AuthToken } = req
  try {
    const bancos = await axios.get(
      'https://noccapi-stg.globalpay.com.co/banks/PSE/',
      { headers: { pm_token: AuthToken } }
    )
    console.log(bancos)
    res.status(200).send(bancos.data)
  } catch (e) {
    res.status(500).send(e)
  }
}

module.exports = {
  obtenerBancos
}
