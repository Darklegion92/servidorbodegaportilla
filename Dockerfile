FROM node:16

COPY ["package.json","package-lock.json","/app/"]

WORKDIR /usr/src

RUN npm install

COPY [".","/app/"]

EXPOSE 80

CMD ["node","src/pruebas.js"]
