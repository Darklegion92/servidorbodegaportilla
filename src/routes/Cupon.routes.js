const { Router } = require("express");
const { isAuth } = require("../middlewares/acceso");
const CuponCtrl = require("../controllers/Cupon.controller");

router = Router();
router
  .get("/validar/:codigo", CuponCtrl.validar)
  .post("/registrar", CuponCtrl.registrar)
  .get("/*", CuponCtrl.error);

module.exports = router;
