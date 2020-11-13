const { Router } = require("express");
const Auth = require("../middlewares/acceso");
const ParametrosCtrl = require("../controllers/Parametros.controller");

router = Router();
router
  .get("/barrios", ParametrosCtrl.consultarBarrios)
  .get("/tiposdocumento", ParametrosCtrl.consultartiposdocumento)
  .get("/carusel", ParametrosCtrl.consultarcarusel)
  .get("/recomendaciones", ParametrosCtrl.consultarrecomendaciones)
  .get("/grupos", ParametrosCtrl.consultargrupos)
  .get("/marcas", ParametrosCtrl.consultarmarcas)
  .get("/subgrupos/:idgrupo", ParametrosCtrl.consultarsubgrupos)
  .delete("/carusel/:id", Auth.isAuth, ParametrosCtrl.eliminarcarusel)
  .post("/subirimg", Auth.isAuth, ParametrosCtrl.subirimg)
  .post("/carusel", Auth.isAuth, ParametrosCtrl.agregarcarusel)
  .put("/carusel", Auth.isAuth, ParametrosCtrl.editarcarusel)
  .get("/*", ParametrosCtrl.error);

module.exports = router;
