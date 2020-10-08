const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ClientesCtrl = require("../controllers/Clientes.controller");

router = Router();
router
  .post("/login", ClientesCtrl.login)

  .post("/loginfacebook", ClientesCtrl.loginFacebook)
  .post("/logingoogle", ClientesCtrl.loginGoogle)
  .post("/register", ClientesCtrl.registro)
  .get("/validar", Auth.isAuth, ClientesCtrl.validarToken)
  .get("/*", ClientesCtrl.error);

module.exports = router;
