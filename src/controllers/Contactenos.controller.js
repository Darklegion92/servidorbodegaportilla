var nodemailer = require('nodemailer')

function enviarContacto (req, res) {
  const { nombre, email, telefono, comunicaciones, mensaje } = req.body

  console.log('Creating transport...')

  let jConfig = {
    service: "gmail", //al usar un servicio bien conocido, no es necesario proveer un nombre de servidor.
    auth: {
      user: "contactos.portilla@gmail.com",
      pass: "hwsyqudoyitrewxu",
    },
  }

  var email2 = {
    from: 'contactos.portilla@gmail.com',
    to: 'ventaenlinea@bodegaportilla.com',
    subject: 'Contacto usuario nuevo',
    text:
    "Email: " +
    email +
    "\n" +
    "Nombre: " +
    nombre +
    "\n" +
    "Teléfono: " +
    telefono +
    "\n" +
    "Aceptó recibir Comunicaciones:" +
    comunicaciones +
    "\n" +
    "Aceptó políticas, Termínos y Condiciones: true" +
    "\n" +
    "Mensaje: " +
    mensaje,
  }

  let createTransport = nodemailer.createTransport(jConfig);

  createTransport.sendMail(email2, function (error, info) { 
    if(error){ 
         console.log("Error al enviar email >>",error); 
      res.status(501).send({ mensaje: error });

    } else{ 
         console.log("Correo enviado correctamente"); 
      res.status(200).send({ mensaje: "Email sent: " + info.response });

    } 
    createTransport.close(); 
});

  /*  var transporter = nodemailer.createTransport({
    service: "gmail", //al usar un servicio bien conocido, no es necesario proveer un nombre de servidor.
    auth: {
      user: "contactos.portilla@gmail.com",
      pass: "B123456789p.",
    },
  });

  var mailOptions = {
    from: "contactos.portilla@gmail.com",
    to: "onlin1992@gmail.com",
    subject: "Contacto usuario nuevo",
    text:
      "Email: " +
      email +
      "\n" +
      "Nombre: " +
      nombre +
      "\n" +
      "Teléfono: " +
      telefono +
      "\n" +
      "Aceptó recibir Comunicaciones:" +
      comunicaciones +
      "\n" +
      "Aceptó políticas, Termínos y Condiciones: true" +
      "\n" +
      "Mensaje: " +
      mensaje,
  };
  transporter.sendMail(mailOptions, function (error, info) {
    if (error) {
      console.log("ERROR!!!!!!", error);
      res.status(501).send({ mensaje: "Error interno no se ha podido enviar" });
    } else {
      res.status(200).send({ mensaje: "Email sent: " + info.response });
      console.log("Email sent: " + info.response);
    }
  });*/

  console.log('End of Script')
}

function error (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.status(404).send({ mensaje: 'Página no encontrada' })
}

module.exports = {
  enviarContacto,
  error
}
