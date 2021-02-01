FROM alpine:latest

# Labels
LABEL company="GDIT"
LABEL maintainer="Janek Claus"
LABEL email="Janek.Claus@GDIT.com"

# Nginx
RUN apk update
RUN apk add nginx

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# Archive original Nginx configuration file, just in case
RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig

# Application
WORKDIR /www
COPY src/* ./

# Start/run
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 5000
CMD ["nginx"]
