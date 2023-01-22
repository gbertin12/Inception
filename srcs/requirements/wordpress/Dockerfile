FROM debian:buster

RUN apt-get update; \
	apt-get install -y php php-fpm php-mysql curl vim bash

RUN mkdir -p /var/run/php/
RUN mkdir -p /var/www/wordpress
RUN chown -R www-data /var/www/wordpress
RUN chmod 775 /var/www/wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY ./conf/wp-config.php /var/www/
COPY ./tools/wp.sh .

EXPOSE 9000

ENTRYPOINT [ "bash", "wp.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F", "-R"]