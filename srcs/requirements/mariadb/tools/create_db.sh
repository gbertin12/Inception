#!/bin/sh

if [ ! -d /var/lib/mysql/wordpress ]; then
	/usr/share/mysql/mysql.server start && 
	mysql -e "
	CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
	CREATE USER '$MYSQL_ROOT'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
   	GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_ROOT}'@'%';
   	FLUSH PRIVILEGES;
	CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';
		GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
   	FLUSH PRIVILEGES;
	ALTER USER root@localhost IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
	FLUSH PRIVILEGES;
	"
	/usr/share/mysql/mysql.server stop && mysqld
fi
exec "$@"
