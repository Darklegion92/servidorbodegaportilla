const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ArticulosCtrl = require("../controllers/Articulos.controller");

router = Router();
router
  .get("/", ArticulosCtrl.consultar)
  .get("/:nombre", ArticulosCtrl.consultarNombre)
  .get("/*", ArticulosCtrl.error);

module.exports = router;
