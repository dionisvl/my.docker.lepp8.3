include .env

up: docker-up
down: docker-down
build:
	docker compose up --build -d

restart:
	make up
	docker compose restart

rebuild:
	docker compose up -d --build --force-recreate

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

migration:
	docker compose exec php-fpm php bin/console make:migration --no-interaction

migrate:
	docker compose exec php-fpm php bin/console doctrine:migrations:migrate --no-interaction

cache-clear:
	docker compose exec php-fpm composer dump-autoload && \
	docker compose exec php-fpm php bin/console cache:clear

tests:
	docker compose exec php-fpm symfony console doctrine:database:drop --force --env=test || true
	docker compose exec php-fpm symfony console doctrine:database:create --env=test
	docker compose exec php-fpm symfony console doctrine:migrations:migrate -n --env=test
	docker compose exec php-fpm symfony console doctrine:fixtures:load -n --env=test
	docker compose exec php-fpm symfony php bin/phpunit $(MAKECMDGOALS)

queue-watch:
	docker compose exec php-fpm symfony console messenger:consume async -vv
