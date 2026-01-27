FROM alpine:latest

COPY index.js .
COPY package.json .
COPY .env .