var nodemailer = require("nodemailer");

function enviarContacto(req, res) {
  const { nombre, email, celular, mensaje } = req.body;

  console.log("Creating transport...");
  var transporter = nodemailer.createTransport({
    service: "gmail", //al usar un servicio bien conocido, no es necesario proveer un nombre de servidor.
    auth: {
      user: "envio.contactosportilla@gmail.com",
      pass: "B123456789p.",
    },
  });

  var mailOptions = {
    from: "envio.contactosportilla@gmail.com",
    to: email,
    subject: "Contacto usuario nuevo",
    text:
      "Email: " +
      email +
      "\n" +
      "Nombre: " +
      nombre +
      "\n" +
      "Celular: " +
      celular +
      "\n" +
      "Mensaje: " +
      mensaje,
  };

  console.log("sending email", mailOptions);
  transporter.sendMail(mailOptions, function (error, info) {
    console.log("senMail returned!");
    if (error) {
      console.log("ERROR!!!!!!", error);
      res.status(501).send({ mensaje: "Error interno no se ha podido enviar" });
    } else {
      res.status(200).send({ mensaje: "Email sent: " + info.response });
      console.log("Email sent: " + info.response);
    }
  });

  console.log("End of Script");
}

function error(req, res) {
  res.setHeader("Content-Type", "application/json");
  res.status(404).send({ mensaje: "Página no encontrada" });
}

module.exports = {
  enviarContacto,
  error,
};
