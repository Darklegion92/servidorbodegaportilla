const express = require('express')
const fs = require('fs')
const https = require('https')
const morgan = require('morgan')
const bodyParser = require('body-parser')
const formData = require('express-form-data')
const cors = require('cors')
const path = require('path')
const passport = require('passport')
const authRouter = require('./routes/Auth.routes')
const carritoRouter = require('./routes/Carrito.routes')
const parametrosRouter = require('./routes/Parametros.routes')
const articulosRouter = require('./routes/Articulos.routes')
const contactenosRouter = require('./routes/Contactenos.routes')
const clientesRouter = require('./routes/Clientes.routes')
const cuponRouter = require('./routes/Cupon.routes')
const pasarelaRouter = require('./routes/GlobalPay.routes')
const AuthRouter = require('./routes/Auth.routes')
const { isAuth } = require('./middlewares/acceso')
const { bancospse } = require('./services/bancospse')

//certificacion
const privateKey = fs.readFileSync(
  '/etc/letsencrypt/live/yourdomain.com/privkey.pem',
  'utf8'
)
const certificate = fs.readFileSync(
  '/etc/letsencrypt/live/yourdomain.com/cert.pem',
  'utf8'
)
const ca = fs.readFileSync(
  '/etc/letsencrypt/live/yourdomain.com/chain.pem',
  'utf8'
)
const credentials = {
  key: privateKey,
  cert: certificate,
  ca: ca
}

//initializations
const app = express()
require('./lib/passport')
const options = {
  uploadDir: path.join(__dirname, 'public/temp'),
  autoClean: false
}
bancospse()

//inicializacion https
const httpsServer = https.createServer(credentials, app)

httpsServer.listen(443, () => {
  console.log('HTTPS Server running on port 443')
})

//settings
app.set('port', process.env.PORT || 3005)

//middlewares
app.use(cors())
app.use(morgan('dev'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(passport.initialize())
app.use(passport.session())
// parse data with connect-multiparty.
app.use(formData.parse(options))
// delete from the request all empty files (size == 0)
app.use(formData.format())
// change the file objects to fs.ReadStream
app.use(formData.stream())
// union the body and the files
app.use(formData.union())

//Global Variables

//Route
app.use('/parametros', parametrosRouter)
app.use('/carrito', authRouter, carritoRouter)
app.use('/articulos', articulosRouter)
app.use('/contactenos', contactenosRouter)
app.use('/admin', authRouter)
app.use('/clientes', clientesRouter)
app.use('/cupon', cuponRouter)
app.use('/pasarela', pasarelaRouter)

//Public
app.use(express.static(path.join(__dirname, 'public')))
//Starting the server
app.listen(app.get('port'), () => {
  console.log('Servidor Corriendo en el puerto ' + app.get('port'))
})
