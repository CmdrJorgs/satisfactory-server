FROM node:alpine3.15

COPY package*.json .

RUN npm install

COPY . .

EXPOSE 80

ENTRYPOINT node index.js
