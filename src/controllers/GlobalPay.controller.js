const axios = require('axios')
const { pasarela } = require("../config/keys")
const { crearToken } = require("../middlewares/globalPlay");



async function statusPSE(idTransaction) {
  const AuthToken = await crearToken();

  const json = await axios.get(
    pasarela.URL + `pse/order/${idTransaction}`,
    { headers: { "auth-token": AuthToken } }
  );

  return json;
}

async function statusCreditCard(idTransaction) {
  const AuthToken = await crearToken();

  const json = await axios.get(
    pasarela.URL + `v2/transaction/${idTransaction}`,
    { headers: { "auth-token": AuthToken } }
  );

  return json;
}

async function pagoPSE(req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.post(
      'https://noccapi-stg.globalpay.com.co/order/',
      {
        carrier: {
          id: 'PSE',
          extra_params: {
            bank_code: '1022',
            response_url: 'https://www.rbmcolombia.com/wps/portal/index/',
            user: {
              name: 'Santiago Sierra',
              fiscal_number: 12312312313,
              type: 'N',
              type_fis_number: 'CC',
              ip_address: '201.0.90.12'
            }
          }
        },
        user: {
          id: 'sdf',
          email: 'user@example.com'
        },
        order: {
          country: 'COL',
          currency: 'COP',
          dev_reference: 'zapato nike',
          amount: 56646,
          vat: 0,
          description: 'prueba'
        }
      },
      { headers: { 'auth-token': AuthToken } }
    )
    if (resp.status === 200) res.status(200).send(resp.data)
  } catch (e) {
    console.log(e)
    res.status(500).send(e)
  }
}

async function pagoCredito(req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.post(
      "https://ccapi-stg.globalpay.com.co/v2/card/delete/",
      {
        card: {
          token: "15716740815297352678",
        },

        user: {
          id: "1",
        },
      },

      { headers: { "auth-token": AuthToken } }
    );
    /*const resp = await axios.post(
      "https://ccapi-stg.globalpay.com.co/v2/card/add",
      {
        user: {
          id: '1',
          email: 'ssierra.ext@rbm.com.co'
        },
        card: {
          number: '4111111111111111',
          holder_name: 'SANTIAGO SIERRA',
          expiry_month: 9,
          expiry_year: 2022,
          cvc: '123',
          type: 'vi'
        }
      },

      { headers: { "auth-token": AuthToken } }
    );*/
    if (resp.status === 200) res.status(200).send(resp.data);
  } catch (e) {
    console.log(e)
    res.status(500).send(e)
  }
}

async function eliminarTarjeta(req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.post(
      'https://ccapi-stg.globalpay.com.co/v2/card/delete/',
      {
        card: {
          token: '15716740815297352678'
        },

        user: {
          id: '1'
        }
      },

      { headers: { 'auth-token': AuthToken } }
    )
    if (resp.status === 200) res.status(200).send(resp.data)
  } catch (e) {
    console.log(e)
    res.status(500).send(e)
  }
}

async function obtenerTarjetas(req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.get(
      'https://ccapi-stg.globalpay.com.co/v2/card/list?uid=1',

      { headers: { 'auth-token': AuthToken } }
    )
    if (resp.status === 200) res.status(200).send(resp.data)
  } catch (e) {
    console.log(e)
    res.status(500).send(e)
  }
}

async function pagoEfectivo(req, res) {
  const { AuthToken } = req
  try {
    const resp = await axios.post(
      'https://noccapi-stg.globalpay.com.co/order/',
      {
        carrier: {
          id: 'payvalida'
        },
        user: {
          id: '10',
          email: 'dmedina@paymentez.com'
        },
        order: {
          country: 'COL',
          currency: 'COP',
          dev_reference: 'test-stg-00001',
          amount: 50002,
          expiration_days: 4,
          recurrent: false,
          description: 'Esto es una prueba en stg para integración de Cash'
        }
      },
      { headers: { 'auth-token': AuthToken } }
    )
    console.log(resp.data)
    if (resp.status === 200) res.status(200).send(resp.data)
  } catch (e) {
    console.log(e)
    res.status(500).send(e)
  }
}
function error(req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
}

module.exports = {
  pagoPSE,
  pagoEfectivo,
  pagoCredito,
  statusCreditCard,
  statusPSE,
  error
}
