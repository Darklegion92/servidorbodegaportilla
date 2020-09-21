const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ClientesCtrl = require("../controllers/Clientes.controller");

router = Router();
router
  .get("/login", ClientesCtrl.login)
  .post("/register", ClientesCtrl.registro)
  .get("/*", ClientesCtrl.error)

module.exports = router;
