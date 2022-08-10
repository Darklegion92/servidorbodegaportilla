const { Router } = require('express')
const { isAuth } = require('../middlewares/acceso')
const AgrupacionesCtrl = require('../controllers/Agrupaciones.controller')

router = Router()
router
  .put('/editar', isAuth, AgrupacionesCtrl.editargrupos)
  .post('/crear', isAuth, AgrupacionesCtrl.creargrupos)
  .get('/*', AgrupacionesCtrl.error)

module.exports = router
