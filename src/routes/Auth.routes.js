const { Router } = require('express')
const UsuarioCtrl = require('../controllers/Auth.controller')
const PruebaCtrl = require('../controllers/Prueba.controller')
const { connectGlobalPlay } = require('../middlewares/globalPlay')

router = Router()
router
  .post('/ingresar', UsuarioCtrl.ingresar)
  .get('/', connectGlobalPlay, PruebaCtrl.obtenerBancos)
  .get('/*', UsuarioCtrl.error)

module.exports = router
