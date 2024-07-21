## Docker LEPP stack with PHP 8.3

## How to Install

- Install Docker and Compose plugin https://docs.docker.com/engine/install/
- `docker network create traefik`
- `mkdir /var/www/my.site` and `cd /var/www/my.site`
- add to your hosts file:
```
127.0.0.1 site.local
127.0.0.1 nginxtest.loc
```

- `git clone THIS_REPO ./`

### Symfony example
- `make bash`
- `symfony new . --version=6.2 --php=8.3 --webapp`
- fix .env file in symfony to this:
```
APP_ENV=${APP_ENV}
APP_SECRET=${APP_SECRET}
DATABASE_URL="postgresql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:5432/${DB_NAME}?serverVersion=16&charset=utf8"
or
DATABASE_URL="mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:3306/${DB_NAME}?serverVersion=8&charset=utf8"
```


# TEST
- open http://nginxtest.loc:777/ - to check Nginx running
- open http://mylepp.local/ - to check App is running



### Deployment
- `make down`
- `git pull`
- `docker compose up --build -d`
- optional: `make composer-install`
- optional: `make migrate`


### Setting Up PhpStorm for PHPUnit and Xdebug

- Settings - PHP - CLI Interpreter
    - Click on `...` - Add new (+) - From Docker-compose
        - Pay attention to the Config field where you need to specify the docker-compose.yml file,
        - and you must take it exactly from Your project
        - In the Service field, choose php-fpm - OK
      - Lifecycle - Connect to existing container
      - OK
  - Now it is very important to add project directory mapping:
      - With the PHP window open
      - Find the `Path mappings` field
      - Click on the folder icon
      - A window `Edit project path mappings` will appear
      - In this window, click on `+` and add a line:
          - Local Path = `//wsl.localhost/Ubuntu-24.04/var/www/my.s7test/app`
          - Remote Path = `/app`
          - OK
  - OK


#### SSL (HTTPS)
- sudo apt-get install nginx python3-certbot-nginx
- sudo certbot --nginx -d app.phpqa.ru
- `sudo cp -r /etc/letsencrypt /var/www/my.docker.lepp8.3/.docker/nginx/letsencrypt`
