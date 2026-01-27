FROM alpine:latest

COPY . .

ENTRYPOINT ["echo", "hello"]