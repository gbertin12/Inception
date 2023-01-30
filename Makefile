
# VOLUME_DB = /home/gbertin/data/mariadb
# VOLUME_WP = /home/gbertin/data/wordpress
VOLUME_DB = /Users/tsawe07/data/mariadb
VOLUME_WP = /Users/tsawe07/data/wordpress


all: 
	mkdir -p ${VOLUME_DB}
	mkdir -p ${VOLUME_WP}
	docker-compose -f srcs/docker-compose.yml up

down: 
	docker-compose -f srcs/docker-compose.yml down

re:
	docker-compose -f srcs/docker-compose.yml up --build

clean: down
	docker rmi -f $(shell docker images -qa)
	docker rm $(shell docker ps -qa)

vclean: 
	$(shell rm -rf /Users/tsawe07/data/)
	docker rmi -f $(shell docker images -qa)
	docker volume rm $(shell docker volume ls -q)
