FROM php:8.3-fpm-alpine3.20

ENV LC_ALL=C.UTF-8

RUN apk add --no-cache curl icu-data-full \
    php83-phar php83-openssl php83-mbstring php83-sodium php83-opcache php83-simplexml php83-dom php83-gmp \
    php83-bcmath php83-xml php83-pdo_mysql php83-ctype php83-xmlwriter php83-xmlreader php83-tokenizer php83-pecl-memcached \
    php83-intl php83-pecl-memcached php83-iconv php83-fileinfo php83-gd php83-ffi php83-zip php83-dev php83-pear \
    gcc build-base g++ make linux-headers zlib procps htop nano icu postgresql libwebp libpng



# Install and configure additional PHP extensions
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && pecl install apcu \
    && echo "extension=xdebug.so" > /etc/php83/conf.d/xdebug.ini \
    && echo "extension=apcu.so" > /etc/php83/conf.d/apcu.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy additional PHP configuration
COPY ./.docker/php-fpm-alpine/conf.d /etc/php83/conf.d

# Set working directory
WORKDIR /app

# Expose port and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
