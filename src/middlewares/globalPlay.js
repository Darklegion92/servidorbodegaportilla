const CryptoJS = require('crypto-js')

async function connectGlobalPlay (req, res, next) {
  res.setHeader('Content-Type', 'application/json')
  try {
    const APPLICATIONCODE = 'BODPORTILLA-GLP-SERVER'
    const serverappkey = '645PLvOSApKZ3ZMsweGhPHQU2zVASs'
    const UNIXTIMESTAMP = Math.floor(Date.now() / 1000)
    const keytime = serverappkey + UNIXTIMESTAMP
    const UNIQTOKEN = CryptoJS.SHA256(keytime)
    const stringUnion = `${APPLICATIONCODE};${UNIXTIMESTAMP};${UNIQTOKEN}`
    req.AuthToken = Buffer.from(stringUnion).toString('base64')
    next()
  } catch (e) {
    console.log(e)
    return res.status(403).send({ err: 'No Tiene Autorización' })
  }
}

async function crearToken () {
  try {
    const APPLICATIONCODE = 'BODPORTILLA-GLP-SERVER'
    const serverappkey = '645PLvOSApKZ3ZMsweGhPHQU2zVASs'
    const UNIXTIMESTAMP = Math.floor(new Date().getTime() / 1000)
    const keytime = serverappkey + UNIXTIMESTAMP
    const UNIQTOKEN = CryptoJS.SHA256(keytime)
    const stringUnion = `${APPLICATIONCODE};${UNIXTIMESTAMP};${UNIQTOKEN}`
    return Buffer.from(stringUnion).toString('base64')
  } catch (e) {
    return 'Error ' + e
  }
}

module.exports = {
  connectGlobalPlay,
  crearToken
}
