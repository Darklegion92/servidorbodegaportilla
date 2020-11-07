const { Router } = require('express')
const Auth = require('../middlewares/acceso')
const GloBalPayCtrl = require('../controllers/GlobalPay.controller')

router = Router()
router
  .get('/', GloBalPayCtrl.consultar)
  .get('/categoria', GloBalPayCtrl.consultarCategoria)
  .get('/*', GloBalPayCtrl.error)

module.exports = router
