FROM alpine:latest

WORKDIR /stuff

COPY . .

ENTRYPOINT ["echo", "hello"]