
all: 
	docker-compose -f srcs/docker-compose.yml up -d

down: 
	docker-compose -f srcs/docker-compose.yml down

re: fclean
	docker-compose -f srcs/docker-compose.yml up -d --build --remove-orphans

fclean:
	docker-compose -f srcs/docker-compose.yml down --rmi all --volumes

