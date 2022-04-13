FILE=/var/www/wordpress/wp-config.php
if [ -f  "$FILE" ]; then
  ### The above condition is true if the file ‘wp-config.php’ exists andis a regular file. ###
  sed -i "s/database_name_here/${WORDPRESS_DB_NAME}/
          s/username_here/${WORDPRESS_DB_USER}/
          s/localhost/${WORDPRESS_DB_HOST}/
          s/password_here/${WORDPRESS_DB_PASSWORD}/
          ### Enable redis Cache Settings in wp-config.php ###
          s/redis host/${WP_REDIS_HOST}/
          s/salt/${WP_CACHE_KEY_SALT}/" $FILE
fi

wp core install --path=/var/www/wordpress/ --allow-root --url=https://myamani.42.fr --title=inception --admin_user=myamani --admin_password=1337 --admin_email=myamani@email.com
wp --path=/var/www/wordpress/ plugin activate redis-cache --allow-root
wp --path=/var/www/wordpress/ redis update-dropin --allow-root
### start php-fpm in foreground ###
./usr/sbin/php-fpm7.3 -F -R

### update-dropin: Update the redis-cache dropin for the current version of WordPress. ###
### plugin activate to activate the plugin redis-cache ###
### ---allow-root used to allow the user to run the command as root. --- ###