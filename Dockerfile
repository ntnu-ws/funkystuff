FROM alpine:latest

COPY . .

ARG STUFF="stuff"
ENV STUFF=$STUFF
RUN echo "STUFF=$STUFF" >>.env

ENTRYPOINT ["sh"]