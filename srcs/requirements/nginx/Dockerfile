#Define a base for your image
FROM debian:buster

#Executes any commands in a new layer on top of the current image 
#and commits the result.
RUN apt-get update && apt-get install -y nginx openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes \
        -out /etc/ssl/certs/gbertin.pem \
        -keyout /etc/ssl/private/gbertin.key \
        -subj "/C=IT/ST=Paris/L=Paris/O=42france/OU=gbertin/CN=gbertin/"

COPY conf/nginx.conf /etc/nginx/conf.d/
RUN mkdir nginx_logs
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
