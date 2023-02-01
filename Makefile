
all: 
	docker-compose -f srcs/docker-compose.yml up -d

down: 
	docker-compose -f srcs/docker-compose.yml down

clean: down
	docker rmi  $(shell docker images -qa)
	docker rm  $(shell docker ps -qa)

vclean: down
	docker rmi $(shell docker images -qa)
	docker rm $(shell docker ps -qa)
	docker volume rm $(shell docker volume ls -q)
