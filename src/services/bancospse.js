var CronJob = require('cron').CronJob
const axios = require('axios')
const { crearToken } = require('../middlewares/globalPlay')
const pool = require('../config/database')

const bancospse = () =>
  new CronJob(
    '* * * * *',
    async function () {
      const AuthToken = await crearToken()

      try {
        const json = await axios.get(
          'https://noccapi-stg.globalpay.com.co/banks/PSE/',
          { headers: { 'auth-token': AuthToken } }
        )
        console.log(json)
        const bancos = json.data.banks

        /*  await pool.query('DELETE FROM bancospse')
        bancos.forEach(async banco => {
          await pool.query('INSERT INTO bancospse SET ?', banco)
        })*/
      } catch (e) {
        // console.log(e)
      }
    },
    null,
    true
  )

module.exports = {
  bancospse
}
