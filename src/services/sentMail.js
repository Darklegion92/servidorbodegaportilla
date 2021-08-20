const keys = require("../config/keys")

var nodemailer = require('nodemailer')


const sentMail = (data) => {

    const { message, subject, email } = data

    const jConfig = {
        service: "gmail", //al usar un servicio bien conocido, no es necesario proveer un nombre de servidor.
        auth: {
            user: "contactos.portilla@gmail.com",
            pass: "hwsyqudoyitrewxu",
        },
    }

    const body = {
        from: 'contactos.portilla@gmail.com',
        to: email || keys.EMAIL_RESPONSE,
        subject,
        text: message,
    }

    const createTransport = nodemailer.createTransport(jConfig);

    createTransport.sendMail(body, function (error, info) {
        if (error) {
            console.log("Error al enviar email >>", error);

        } else {
            console.log("Correo enviado correctamente");
        }
        createTransport.close();
    });
}


module.exports = {
    sentMail
}


