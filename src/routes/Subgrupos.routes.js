const { Router } = require('express')
const { isAuth } = require('../middlewares/acceso')
const AgrupacionesCtrl = require('../controllers/Agrupaciones.controller')

router = Router()
router
  .put('/editar', isAuth, AgrupacionesCtrl.editarsubgrupos)
  .post('/crear', isAuth, AgrupacionesCtrl.crearsubgrupos)
  .get('/*', AgrupacionesCtrl.error)

module.exports = router
