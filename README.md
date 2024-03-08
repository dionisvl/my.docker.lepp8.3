## Docker LEPP stack with PHP 8.3

## How to Install

- Install Docker and Compose plugin https://docs.docker.com/engine/install/
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


