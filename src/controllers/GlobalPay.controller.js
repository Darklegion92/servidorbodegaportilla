const axios = require("axios");

async function pagoPSE(req, res) {
  const { AuthToken } = req;
  try {
    const resp = await axios.post(
      "https://noccapi-stg.globalpay.com.co/order/",
      {
        carrier: {
          id: "PSE",
          extra_params: {
            bank_code: "1022",
            response_url: "https://www.rbmcolombia.com/wps/portal/index/",
            user: {
              name: "Santiago Sierra",
              fiscal_number: 12312312313,
              type: "N",
              type_fis_number: "CC",
              ip_address: "201.0.90.12",
            },
          },
        },
        user: {
          id: "sdf",
          email: "user@example.com",
        },
        order: {
          country: "COL",
          currency: "COP",
          dev_reference: "zapato nike",
          amount: 56646,
          vat: 0,
          description: "prueba",
        },
      },
      { headers: { "auth-token": AuthToken } }
    );
    if (resp.status === 200) res.status(200).send(resp.data);
  } catch (e) {
    console.log(e);
    res.status(500).send(e);
  }
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  pagoPSE,
  error,
};
