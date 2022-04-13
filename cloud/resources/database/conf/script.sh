#!/bin/bash

if [ ! -d "/var/lib/mysql/wordpress" ]; then 
    
    mysql_install_db
    service mysql start
    
	mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;"
    mysql -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
	mysql -p $MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

    sleep 10
    service mysql stop
    sleep 5
fi

cd '/usr' ; /usr/bin/mysqld_safe --datadir='/var/lib/mysql'
# mysqld_safe