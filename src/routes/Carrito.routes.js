const { Router } = require("express");
const { isAuth } = require("../middlewares/acceso");
const { connectGlobalPlay } = require("../middlewares/globalPlay");
const CarritoCtrl = require("../controllers/Carrito.controller");

router = Router();
router
  .get("/consultar/:idorden", connectGlobalPlay, CarritoCtrl.consultar)
  .get("/consultar", connectGlobalPlay, CarritoCtrl.consultarTodas)
  .put("/item", isAuth, CarritoCtrl.agregarItem)
  .put("/actualizarestado", isAuth, CarritoCtrl.actualizarEstado)
  .post("/item/delete", isAuth, CarritoCtrl.eliminarItem)
  .post("/item/update", isAuth, CarritoCtrl.editarItem)
  .put("/guardar", connectGlobalPlay, CarritoCtrl.guardarCarrito)
  .delete("/:id", isAuth, CarritoCtrl.eliminar)
  .get("/*", CarritoCtrl.error);

module.exports = router;
