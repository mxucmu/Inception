NAME = inception

.PHONY: addhost addvolume rmvolume up down prune re all

all: addvolume up

addhost:
	echo "127.0.0.1 mxu.42.fr" >> /etc/hosts

addvolume:
	mkdir -p /home/mxu/data/site
	mkdir -p /home/mxu/data/database

rmvolume:
	rm -rf /home/mxu/data

rmimage:
	docker image rm srcs_wordpress srcs_mariadb srcs_nginx

up:
	docker-compose -f srcs/docker-compose.yml up --detach --build

down:
	docker-compose -f srcs/docker-compose.yml down

prune: down
	docker system prune -f
	docker volume rm srcs_wordpress_website srcs_website_database

clean: prune rmvolume

fclean: clean rmimage

re: clean addvolume up
