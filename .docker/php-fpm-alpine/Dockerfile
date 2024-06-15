FROM php:8.3-fpm-alpine

# Set environment variable
ENV LC_ALL=C.UTF-8

# Install necessary packages
RUN apk add --no-cache \
    supervisor \
    nginx \
    curl \
    icu-data-full \
    php83 \
    php83-fpm \
    php83-phar \
    php83-openssl \
    php83-mbstring \
    php83-sodium \
    php83-opcache \
    php83-simplexml \
    php83-dom \
    php83-gmp \
    php83-bcmath \
    php83-xml \
    php83-pdo_mysql \
    php83-ctype \
    php83-xmlwriter \
    php83-xmlreader \
    php83-tokenizer \
    php83-pecl-memcached \
    php83-intl \
    php83-iconv

# Create and configure user and group
#RUN addgroup -S app-data && \
#    adduser -D app-data -G app-data && \
#    addgroup nginx app-data && \
#    mkdir -p /var/www/app && \
#    chown app-data.app-data /var/www/app



# Install graphviz
RUN apk add --no-cache graphviz

# Install and enable APCu
#RUN pecl install apcu \
#    && docker-php-ext-enable apcu

# Ensure the directory for additional ini files is available
# Xdebug also here
COPY ./.docker/php-fpm-alpine/conf.d /usr/local/etc/php/conf.d

# Install symfony-cli
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | sh

RUN apk add --update linux-headers
# Install Xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Set the working directory for PHP
WORKDIR /app

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
