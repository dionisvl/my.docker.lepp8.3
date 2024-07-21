<p>
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://media.sylius.com/sylius-logo-800-dark.png">
      <source media="(prefers-color-scheme: light)" srcset="https://media.sylius.com/sylius-logo-800.png">
      <img alt="Sylius Logo." src="https://media.sylius.com/sylius-logo-800.png">
    </picture>
</p>

## Installation

### Traditional
```bash
$ wget http://getcomposer.org/composer.phar
$ php composer.phar create-project sylius/sylius-standard project
$ cd project
$ yarn install
$ yarn build
$ php bin/console sylius:install
$ symfony serve
$ open http://localhost:8000/
```

```bash
composer create-project sylius/sylius-standard .

.env: DATABASE_URL="mysql://${DB_USER}:${DB_PASSWORD}@${DB_HOST}:3306/${DB_NAME}?serverVersion=8&charset=utf8mb4"

php bin/console sylius:install

curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install -y nodejs
# node -v
sudo npm install --global yarn
sudo yarn install
sudo yarn build
```

For more detailed instruction please visit [installation chapter in our docs](https://docs.sylius.com/en/latest/book/installation/installation.html).


## Troubleshooting

If something goes wrong, errors & exceptions are logged at the application level:

```
tail -f var/log/prod.log
tail -f var/log/dev.log
```

