#!/bin/sh

	if [ ! -f /var/www/html/wp-config.php ]; then
		until mysqladmin -hmariadb -u${MYSQL_USER} -p${MYSQL_USER_PASSWORD} ping; do
        	sleep 2 && echo -e "\e[1;31m can't connect to database"
		done
			#mv /var/www/html/wp-config.php /var/www/html
			wp core download --allow-root --path="/var/www/html";
			cd /var/www/html;
			wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=${MYSQL_HOSTNAME} --dbcharset="utf8";
			wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_MAIL};
			wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_USER_MAIL} --role="author" --user_pass=${WORDPRESS_USER_PASSWORD}; 
	fi
exec "$@"
