const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const { connectGlobalPlay } = require("../middlewares/globalPlay");
const CarritoCtrl = require("../controllers/Carrito.controller");

router = Router();
router
  .get("/consultar/:idorden", connectGlobalPlay, CarritoCtrl.consultar)
  .put("/item", Auth.isAuth, CarritoCtrl.agregarItem)
  .post("/item/delete", Auth.isAuth, CarritoCtrl.eliminarItem)
  .post("/item/update", Auth.isAuth, CarritoCtrl.editarItem)
  .put("/guardar", connectGlobalPlay, CarritoCtrl.guardarCarrito)
  .get("/*", CarritoCtrl.error);

module.exports = router;
