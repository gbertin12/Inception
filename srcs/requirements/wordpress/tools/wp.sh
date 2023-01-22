#!/bin/sh

	if [ ! -f /var/www/wordpress/wp-config.php ]; then

		mv /var/www/wp-config.php /var/www/wordpress/
		wp core download --allow-root --path="/var/www/wordpress";
		cd /var/www/wordpress;
		# wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=${MYSQL_HOSTNAME} --dbcharset="utf8";
		wp core install --allow-root --url=${WORDPRESS_URL} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_ADMIN} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_MAIL};
		wp user create --allow-root ${WORDPRESS_USER} ${WORDPRESS_USER_MAIL} --role="author" --user_pass=${WORDPRESS_USER_PASSWORD}; 
	fi
exec "$@"