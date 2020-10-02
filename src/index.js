const express = require("express");
const morgan = require("morgan");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require("path");
const passport = require("passport");
const authRouter = require("./routes/Auth.routes");
const carritoRouter = require("./routes/Carrito.routes");
const parametrosRouter = require("./routes/Parametros.routes");
const articulosRouter = require("./routes/Articulos.routes");
const contactenosRouter = require("./routes/Contactenos.routes");
const clientesRouter = require("./routes/Clientes.routes");
const AuthRouter  =require("./routes/Auth.routes")
const { isAuth } = require("./middlewares/acceso");

//initializations
const app = express();
require("./lib/passport");
//settings
app.set("port", process.env.PORT || 3002);

//middlewares
app.use(cors());
app.use(morgan("dev"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(passport.initialize());
app.use(passport.session());

//Global Variables

//Route
app.use("/parametros", parametrosRouter);
app.use("/carrito", authRouter, carritoRouter);
app.use("/articulos", articulosRouter);
app.use("/contactenos", contactenosRouter);
app.use("/admin", authRouter);
app.use("/clientes", clientesRouter);


//Public
app.use(express.static(path.join(__dirname, "public")));
//Starting the server
app.listen(app.get("port"), () => {
  console.log("Servidor Corriendo en el puerto " + app.get("port"));
});
