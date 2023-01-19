#!/bin/sh

if [ ! -d /var/lib/mysql/wordpress ]; then
	/usr/share/mysql/mysql.server start && 
	mysql -e "
	CREATE DATABASE wordpress;
	CREATE USER 'admin'@'%' IDENTIFIED BY 'root123';
   	GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%';
   	FLUSH PRIVILEGES;
	CREATE USER 'gbertin'@'%' IDENTIFIED BY 'PWDPWD12';
		GRANT ALL PRIVILEGES ON wordpress.* TO 'gbertin'@'%';
   	FLUSH PRIVILEGES;
	"
	/usr/share/mysql/mysql.server stop && mysqld
fi
exec "$@"