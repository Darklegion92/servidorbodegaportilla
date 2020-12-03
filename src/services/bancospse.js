var CronJob = require("cron").CronJob;
const axios = require("axios");
const { crearToken } = require("../middlewares/globalPlay");
const pool = require("../config/database");

const bancospse = () =>
  new CronJob(
    "59 23 * * *",
    async function () {
      const AuthToken = await crearToken();

      try {
        const json = await axios.get(
          "https://noccapi-stg.globalpay.com.co/banks/PSE/",
          { headers: { "auth-token": AuthToken } }
        );
        if (json.status === 200) {
          const bancos = json.data.banks;
          await pool.query("TRUNCATE bancospse");
          await bancos.forEach(async (banco) => {
            await pool.query("INSERT INTO bancospse set ?", banco);
          });
        }
      } catch (e) {}
    },
    null,
    true
  );

module.exports = {
  bancospse,
};
