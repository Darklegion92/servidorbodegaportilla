const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ClientesCtrl = require("../controllers/Clientes.controller");

router = Router();
router
  .get("/login", ClientesCtrl.login)
  .get("/*", ClientesCtrl.error)
  .post("/register");

module.exports = router;
