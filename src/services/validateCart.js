var CronJob = require("cron").CronJob;
const pool = require("../config/database");
const { statusPSE, statusCreditCard } = require("../controllers/GlobalPay.controller");
const moment = require('moment')
const { sentMail } = require('./sentMail')

const validateCart =
  new CronJob(
    "30 * * * * *",
    async function () {

      //consultar la base de datos y traer facturas que esten pendientes por pagar
      const sql = 'SELECT * FROM apirest.ordenes WHERE apirest.ordenes.idestado = 1 AND apirest.ordenes.idestado_pago = 1'
      const result = await pool.query(sql)

      if (result.length > 0) {
        //validar que la fecha de creacion sea inferior a 48 horas si son cambiarlas a estado canceladas
        const idCancel = result.reduce((a, b) => {
          if (moment(moment()).diff(b.fecha, 'hours') >= 48) {
            return a.concat(`${b.id},`)
          }
          return a
        }, '')


        if (idCancel) {
          const result1 = await pool.query(`UPDATE apirest.ordenes SET finalizada=1,idestado=5, idestado_pago=3, numeropago=null  WHERE id in (${idCancel.substring(0, idCancel.length - 1)})`)
          if (result1.affectedRows > 0) console.log("Cancelados pedidos con mas de 48 horas");
        }
        //las que queden sin cancelar proceder a consultar el endpoint de globalpay para verificar su estado, si su estado cambio actualizar y enviar correo

        const idConfirm = result.filter(item => moment(moment()).diff(item.fecha, 'hours') < 48)

        idConfirm.forEach(async item => {

          let json

          if (item.idtipo_pago === 4) {
            json = await statusPSE(item.numeropago)
          } else if (item.idtipo_pago === 3) {
            json = await statusCreditCard(item.numeropago)
          }

          if (json?.status === 200) {
            let client
            if (item.idcliente) {
              client = await pool.query('SELECT * FROM clientes WHERE id=?', [item.idcliente])
            }
            if (json.data.transaction.status === 'failure') {
              const message = `El pago para del pedido ${item.id} por valor de ${item.total} fue RECHAZADO y su pedido CANCELADO No. Transacción ${item.numeropago}`
              const subject = `Transacción No. ${item.numeropago} ha sido RECHAZADA`
              sentMail({ message, subject })
              if (client) sentMail({ message, subject, email: client[0]?.email })
              await pool.query('UPDATE ordenes set idestado_pago=3,idestado=5 where id=?', [
                item.id
              ])
            } else if (json.data.transaction.status === 'approved') {
              const message = `El pago para del pedido ${item.id} por valor de ${item.total} fue APROBADO y su pedido pedido esta siendo preparado No. Transacción ${item.numeropago}`
              const subject = `Transacción No. ${item.numeropago} ha sido APROBADA`
              sentMail({ message, subject })
              if (client) sentMail(message, subject, client[0]?.email)
              await pool.query('UPDATE ordenes set idestado_pago=2 where id=?', [
                item.id
              ])
            }
          }

        })
      }
    },
    null,
    true
  );

module.exports = {
  validateCart,
};
