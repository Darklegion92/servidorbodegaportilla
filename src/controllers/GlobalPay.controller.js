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

async function pagoPSE (req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.get(
      'https://noccapi-stg.globalpay.com.co/order/',
      {
        carrier: {
          id: 'PSE',
          extra_params: {
            bank_code: '1022',
            response_url: 'http://prueba.bodegaportilla.com',
            origin_account: {
              application_code: '',
              account_number: '',
              account_type: '',
              account_nit: '',
              account_number: '',
              account_type: '',
              account_identification: '',
              account_identification_type: '',
              account_bank_code: ''
            },
            user: {
              name: '',
              type: '',
              type_fis_number: '',
              fiscal_number: '',
              ip_address: ''
            }
          }
        },
        user: { id: '', email: '' },
        order: {
          dev_reference: '',
          amount: '',
          vat: '',
          description: '',
          country: '',
          currency: ''
        }
      },
      { headers: { 'auth-token': AuthToken } }
    )
    res.status(200).send(resp)
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
  pagoPSE,
  error
}
