FROM debian:buster

RUN apt-get update -y && apt-get install -y mariadb-server
### create a new mysql directory ###
RUN mkdir /var/run/mysqld
### chown is used to change the owner of the files in the container ###
RUN chown -R mysql:mysql /var/run/mysqld
### copy script.sh to mariadb container ###
COPY conf/script.sh /script.sh
### chmod +x to give execute permission to script.sh ###
RUN chmod +x /script.sh
### 0.0.0.0 used to allow access from any ip address ###
RUN sed -i "s/127.0.0.1/0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
EXPOSE 3306
CMD ["./script.sh"]