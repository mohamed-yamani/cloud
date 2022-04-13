FROM debian:buster

### install curl, wget, unzip, php and all it dependencies ###
RUN apt-get -y update && apt-get install -y curl wget unzip ftp php php-cli php-fpm php-common php-json php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath php-redis

RUN mkdir /var/www/
### download wordpress latest version ###
ADD https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz
### download move and unzip redis-cache ###
ADD https://downloads.wordpress.org/plugin/redis-cache.2.0.23.zip /var/www/redis-cache.2.0.23.zip
RUN cd /var/www && tar zxf latest.tar.gz 
### COPY wp-config.php from machine to container (var/www/wordpress) ###
COPY conf/wp-config.php /var/www/wordpress/
COPY conf/wpconf.sh /wpconf.sh
### +x to give execute permission to wpconf.sh ###
RUN chmod +x /wpconf.sh

### listen = 0.0.0.0:9000 to allow access from other hosts ###
RUN sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/7.3/fpm/pool.d/www.conf

### This PHP script for WordPress was originally developed by Eric Mann. It is a Redis object cache backend for WordPress. ###
        # RUN wget https://assets.digitalocean.com/articles/wordpress_redis/object-cache.php
### wp-cli is a command line interface for WordPress ###
        # RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
### Move the file to the /wp-content directory of your WordPress installation: ###
        # RUN mv object-cache.php /var/www/wordpress/wp-content/

    # RUN mv /var/www/redis-cache /var/www/wordpress/wp-content/plugins/

### move wp to /usr/local/bin to execute it from anywhere withouth need there path ### 
    # RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

### chown is used to change the owner of the files in the container ###
RUN chown -R www-data:www-data /var/www/wordpress

### php-fpm is a fastcgi server for PHP , restart it after changes ###
RUN service php7.3-fpm start && service php7.3-fpm stop

VOLUME [ "/var/www/wordpress" ]

EXPOSE 9000

CMD ./wpconf.sh