#!/bin/sh

	wp core download --allow-root --path="/var/www/html";
	cd /var/www/html;
	wp config create --allow-root --dbname="worpress" --dbuser="gbertin" --dbpass="PWDPWD12" --dbhost="mariadb" --dbcharset="utf8";
	wp core install --allow-root --url="gbertin.42.fr" --title="wordpress" --admin_user="admin" --admin_password="pwd1212" --admin_email="admin@42.fr";
	wp user create --allow-root gbertin gbertin@42.fr --role="author" --user_pass="PWDPWD12"; 
exec "$@"