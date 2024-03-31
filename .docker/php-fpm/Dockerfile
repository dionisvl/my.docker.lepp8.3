FROM php:8.3.3-fpm-bookworm

LABEL MAINTAINER="<dionisvl3@gmail.com>"
LABEL RELEASEDATE="20240308"

# Install Node.js and npm
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash -

# Ensure the directory for additional ini files is available
COPY ./.docker/php-fpm/conf.d /usr/local/etc/php/conf.d

# Install symfony-cli
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash

# Install Xdebug
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get update && apt-get install -y \
    symfony-cli \
    nodejs \
    curl \
    zip \
    unzip \
    git \
    libicu-dev \
    libonig-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    libxml2-dev \
    libxslt1-dev \
    libpq-dev \
    postgresql-client \
    libredis-perl \
    librabbitmq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_pgsql exif pcntl intl zip xml xsl pdo_pgsql mbstring
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-enable opcache
RUN pecl install redis amqp \
    && docker-php-ext-enable redis amqp

RUN apt-get update && apt-get install -y graphviz

# Install and enable APCu
RUN pecl install apcu \
    && docker-php-ext-enable apcu

# Set the working directory for PHP
WORKDIR /app

RUN git config --global user.email "userName@example.com"
RUN git config --global user.name "userName"

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
