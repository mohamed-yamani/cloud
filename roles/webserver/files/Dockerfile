FROM nginx:1.13-alpine

RUN apk add --update --no-cache \
    openssl


# RUN apt-get -y update && apt-get install -y nginx openssl
COPY nginx.conf /etc/nginx/conf.d/
# RUN mv /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-available/default
EXPOSE 80 433
RUN openssl req -x509 -nodes -days 365 \
-subj "/C=MA/ST=KH/O=Company, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 \
-keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;
CMD ["nginx", "-g", "daemon off;"]