const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ContactenosCtrl = require("../controllers/Contactenos.controller");

router = Router();
router
  .post("/", ContactenosCtrl.enviarContacto)
  .get("/*", ContactenosCtrl.error);

module.exports = router;
