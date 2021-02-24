const { Router } = require('express')
const { isAuth } = require('../middlewares/acceso')
const ArticulosCtrl = require('../controllers/Articulos.controller')

router = Router()
router
  .get('/', ArticulosCtrl.consultar)
  .get('/categoria', ArticulosCtrl.consultarCategoria)
  .delete('/:id', ArticulosCtrl.eliminarArticulo)
  .get('/consultar', ArticulosCtrl.consultarCodigo)
  .put('/editar', isAuth, ArticulosCtrl.editar)
  .post('/crear', isAuth, ArticulosCtrl.crear)
  .get('/*', ArticulosCtrl.error)

module.exports = router
