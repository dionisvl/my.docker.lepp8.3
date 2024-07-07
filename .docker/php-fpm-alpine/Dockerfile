FROM php:8.3-fpm-alpine

ENV LC_ALL=C.UTF-8

# Install system packages
RUN apk add --no-cache \
    bash \
    bash-completion \
    supervisor \
    nginx \
    curl \
    icu-data-full \
    graphviz \
    zip \
    libpng-dev \
    libxml2-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    oniguruma-dev \
    linux-headers \
    zlib-dev \
    libzip-dev \
    procps \
    htop \
    nano \
    icu-dev \
    postgresql-dev \
    libwebp-dev \
    nodejs \
    npm

# Install PHP extensions
RUN apk add --no-cache \
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
    php83-iconv \
    php83-exif \
    php83-gd \
    php83-curl \
    php83-pgsql

# Install and configure PHP extensions using docker-php-ext-install
RUN docker-php-ext-install \
    bcmath \
    exif \
    gd \
    mysqli \
    pdo_mysql \
    mbstring \
    xml \
    zip \
    intl \
    pdo_pgsql \
    pgsql \
    calendar

# Configure GD with WebP, JPEG, and FreeType support
RUN docker-php-ext-configure gd \
    --with-webp \
    --with-jpeg \
    --with-freetype \
    && docker-php-ext-install gd

# Install and enable Xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy additional PHP configuration
COPY ./.docker/php-fpm-alpine/conf.d /usr/local/etc/php/conf.d

# Set working directory
WORKDIR /app

# Expose port and start PHP-FPM
EXPOSE 9000
CMD ["php-fpm"]
