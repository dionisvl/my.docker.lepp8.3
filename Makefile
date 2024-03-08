include .env

up: docker-up
down: docker-down
build:
	docker compose up --build -d
build-r:
	make down
	make build
docker-up:
	docker compose up -d

docker-down:
	docker compose down --remove-orphans

composer-install:
	docker compose exec php-fpm composer install
composer-update:
	docker compose exec php-fpm composer update


bash:
	docker compose exec php-fpm /bin/bash
sh:
	docker compose exec php-fpm /bin/sh
