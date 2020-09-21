const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const CarritoCtrl = require("../controllers/Carrito.controller");

router = Router();
router
  .post("/", CarritoCtrl.guardar)
  .get("/*", CarritoCtrl.error)

module.exports = router;
