const { Router } = require('express')
const { isAuth } = require('../middlewares/acceso')
const ArticulosCtrl = require('../controllers/Articulos.controller')

router = Router()
router
  .get('/', ArticulosCtrl.consultar)
  .get('/categoria', ArticulosCtrl.consultarCategoria)
  .get('/consultar', ArticulosCtrl.consultarCodigo)
  .put('/editar', isAuth, ArticulosCtrl.editar)
  .put('/crear', isAuth, ArticulosCtrl.crear)
  .get('/*', ArticulosCtrl.error)

module.exports = router
