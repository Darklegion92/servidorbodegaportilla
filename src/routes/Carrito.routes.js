const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const CarritoCtrl = require("../controllers/Carrito.controller");

router = Router();
router
  .put("/item", Auth.isAuth, CarritoCtrl.agregarItem)
  .post("/item/delete", Auth.isAuth, CarritoCtrl.eliminarItem)
  .post("/item/update", Auth.isAuth, CarritoCtrl.editarItem)
  .post("/validar", CarritoCtrl.validar)
  .post("/", CarritoCtrl.guardar)
  .get("/*", CarritoCtrl.error);

module.exports = router;
