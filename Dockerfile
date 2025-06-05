FROM php:8.2-fpm

# Instalar dependências
RUN apt-get update && apt-get install -y \
    git curl unzip zip libpng-dev libonig-dev libxml2-dev libzip-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip gd

# Instalar Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copiar projeto Laravel
WORKDIR /var/www
COPY . .

# Instalar dependências do Laravel
RUN composer install --no-dev --optimize-autoloader

# Gerar chave de app
RUN php artisan key:generate || true  # evita falhar se env não está configurado

CMD ["php-fpm"]
