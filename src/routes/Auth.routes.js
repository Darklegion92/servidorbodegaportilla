const { Router } = require('express')
const UsuarioCtrl = require('../controllers/Auth.controller')

const { connectGlobalPlay } = require('../middlewares/globalPlay')

router = Router()
router.post('/ingresar', UsuarioCtrl.ingresar).get('/*', UsuarioCtrl.error)

module.exports = router
