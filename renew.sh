#!/bin/bash

rm -rf /home/SOLTEC/servidores/servidorbodegaportilla/greenlock.d/accounts/

pm2 stop apirest.js
pm2 delete apirest.js
pm2 start /home/SOLTEC/servidores/servidorbodegaportilla/apirest.js
