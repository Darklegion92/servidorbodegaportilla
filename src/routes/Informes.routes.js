const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const InformesCtrl = require("../controllers/Informes.controller");

router = Router();
router
  .get("/salesCustomer", Auth.isAuth, InformesCtrl.salesCustomer)
  .get("/salesProduct", Auth.isAuth, InformesCtrl.salesProduct)
  .get("/*", InformesCtrl.error);

module.exports = router;
