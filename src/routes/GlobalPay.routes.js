const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const { connectGlobalPlay } = require("../middlewares/globalPlay");
const GloBalPayCtrl = require("../controllers/GlobalPay.controller");

router = Router();
router
  .get("/PSE", connectGlobalPlay, GloBalPayCtrl.pagoPSE)
  .get("/*", GloBalPayCtrl.error);

module.exports = router;
