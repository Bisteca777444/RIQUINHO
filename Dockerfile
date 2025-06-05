FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    git curl unzip zip libpng-dev libonig-dev libxml2-dev libzip-dev libicu-dev \
 && docker-php-ext-install pdo pdo_mysql mbstring zip gd intl

# Copia o composer do container oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

COPY . .

RUN composer install --no-dev --optimize-autoloader

# ... resto do Dockerfile
