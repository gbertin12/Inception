#Define a base for your image
FROM debian:buster

#Executes any commands in a new layer on top of the current image 
#and commits the result.
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/ssl/gbertin.pem \
        -keyout /etc/ssl/gbertin.key \
        -subj "/C=IT/ST=Paris/L=Paris/O=42france/OU=gbertin/CN=gbertin/"

COPY conf/nginx.conf /etc/nginx/conf.d/
RUN mkdir nginx_logs
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]