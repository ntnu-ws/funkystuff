FROM alpine:latest

COPY . .

ARG STUFF="stuff"
ENV STUFF=$STUFF
RUN echo "STUFF=$STUFF" >>.env

RUN echo "STUFF="

ENTRYPOINT ["echo", "hello"]