FROM php:8.3-fpm-alpine3.20

ENV LC_ALL=C.UTF-8

RUN apk add --no-cache curl wget bash icu-data-full \
    php83-phar php83-openssl php83-mbstring php83-sodium php83-opcache php83-simplexml php83-dom php83-gmp \
    php83-bcmath php83-xml php83-ctype php83-xmlwriter php83-xmlreader php83-tokenizer php83-pecl-memcached \
    php83-intl php83-pecl-memcached php83-iconv php83-fileinfo php83-gd php83-ffi php83-zip php83-dev php83-pear \
    gcc build-base g++ make linux-headers zlib procps htop nano icu postgresql-dev libpq-dev libwebp libpng \
    php83-pdo php83-pdo_pgsql php83-pdo_mysql git

# Install and configure additional PHP extensions
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && pecl install apcu \
    && echo "extension=xdebug.so" > /etc/php83/conf.d/xdebug.ini \
    && echo "extension=apcu.so" > /etc/php83/conf.d/apcu.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN docker-php-ext-install pdo_mysql pdo_pgsql
RUN docker-php-ext-enable pdo_mysql pdo_pgsql

# Install Node.js 20 and npm
RUN apk add --no-cache \
    nodejs-current \
    npm

# Install Yarn globally
RUN npm install -g yarn

# Copy additional PHP configuration
COPY ./.docker/php-fpm-alpine/conf.d /etc/php83/conf.d

# Set working directory
WORKDIR /app

RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash
RUN apk add symfony-cli
RUN git config --global --add safe.directory /app

# Expose port and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
