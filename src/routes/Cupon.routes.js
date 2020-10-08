const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const CuponCtrl = require("../controllers/Cupon.controller");

router = Router();
router.get("/validar/:codigo", CuponCtrl.validar).get("/*", CuponCtrl.error);

module.exports = router;
