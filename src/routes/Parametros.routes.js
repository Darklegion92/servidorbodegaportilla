const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ParametrosCtrl = require("../controllers/Parametros.controller");

router = Router();
router
  .get("/carusel",ParametrosCtrl.consultarcarusel)
  .get("/recomendaciones",ParametrosCtrl.consultarrecomendaciones)
  .get("/grupos",ParametrosCtrl.consultargrupos)
  .get("/marcas",ParametrosCtrl.consultarmarcas)
  .get("/subgrupos/:idgrupo",ParametrosCtrl.consultarsubgrupos)
  .get("/*", ParametrosCtrl.error);

module.exports = router;
