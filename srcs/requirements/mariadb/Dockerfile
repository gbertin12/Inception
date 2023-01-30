FROM debian:buster

RUN apt-get update; \
	apt-get install -y mariadb-server mariadb-client vim bash

RUN mkdir -p var/run/mysqld 
RUN chown -R mysql:root /run/mysqld && chown -R mysql:mysql /var/lib/mysql

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create_db.sh .

EXPOSE 3306

ENTRYPOINT [ "bash", "create_db.sh" ]

CMD [ "mysqld" ]



