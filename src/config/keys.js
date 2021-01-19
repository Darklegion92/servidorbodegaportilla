module.exports ={
    database:{
        host:'localhost',
        user:'root',
        password:'1234',
        database:'apirest',
    },
    pasarela:{
        URL:"https://noccapi.globalpay.com.co/",
        URL_CREDIT: "https://ccapi.globalpay.com.co/",
        APPLICATIONCODE:"BPORTILLA-GLP-SERVER",
        serverappkey : "PecYaTZAxeHKHl0MxKDUOTZu4TwQpd",
        APPLICATIONCODECLIENT : "BPORTILLA-GLP-CLIENT",
        serverappkeyclient: "CRVXdnNVLbUnTUVLJ6XwNasXMu4J1L",
    },
    pasarela_pruebas:{
        URL:"https://noccapi-stg.globalpay.com.co/",
        URL_CREDIT: "https://ccapi-stg.globalpay.com.co/",
        APPLICATIONCODE:"BODPORTILLA-GLP-SERVER",
        serverappkey : "645PLvOSApKZ3ZMsweGhPHQU2zVASs",
        APPLICATIONCODECLIENT : "BODPORTILLA-GLP-CLIENT",
        serverappkeyclient: "ISDsU7y78PbMCohFXdfB8rci4EgLcl",
    },
    SECRET_TOKEN:"SOLTEC"
}