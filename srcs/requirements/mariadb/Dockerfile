FROM debian:buster

RUN apt-get update; \
	apt-get install -y mariadb-server mariadb-client vim bash

RUN mkdir -p var/run/mysqld \
	&& chown -R mysql:mysql var/run/mysqld 


COPY ./conf/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/create_db.sh .

EXPOSE 3306

ENTRYPOINT [ "bash", "create_db.sh" ]

CMD [ "mysqld", "--bind-address=0.0.0.0" ]



