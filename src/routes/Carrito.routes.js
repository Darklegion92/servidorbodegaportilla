const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const CarritoCtrl = require("../controllers/Carrito.controller");

router = Router();
router


  .get("/*", CarritoCtrl.error)
  .post("/validar", CarritoCtrl.validar)
  .post("/", CarritoCtrl.guardar);

module.exports = router;
