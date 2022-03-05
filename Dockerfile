FROM node:16

COPY ["package.json","package-lock.json","/app/"]

WORKDIR /app

RUN npm install

COPY [".","."]

EXPOSE 80

CMD ["node","src/pruebas.js"]
