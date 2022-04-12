FROM debian:buster

RUN apt-get -y update && apt-get install -y nginx openssl
COPY conf/nginx.conf /etc/nginx/sites-available/default
# COPY /home/vagrant/nginx/file.php /file.php

### chown is used to change the owner of the files in the container ###
RUN mkdir -p /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

EXPOSE 80 433
### openssl is used to generate a self-signed certificate ###
RUN openssl req -x509 -nodes -days 365 \
-subj "/C=KH/ST=KH/O=Company, Inc./CN=myamani.42.fr" \
-addext "subjectAltName=DNS:myamani.42.fr" \
-newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt;

### nginx -g daemon off to run nginx server in the background ###
CMD ["nginx", "-g", "daemon off;"]