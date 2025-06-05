# Usa a imagem oficial PHP 8.2 com FPM
FROM php:8.2-fpm

# Instalar dependências de sistema e extensões PHP necessárias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    unzip \
    zip \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl pdo pdo_mysql mbstring zip gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copiar o composer do container oficial para usar no build
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Definir diretório de trabalho
WORKDIR /var/www

# Copiar todo o projeto para dentro do container
COPY . .

# Instalar dependências PHP via composer (prod)
RUN composer install --no-dev --optimize-autoloader

# Gerar chave da aplicação Laravel
RUN php artisan key:generate

# Dar permissão para storage e bootstrap/cache (muito importante no Laravel)
RUN chown -R www-data:www-data storage bootstrap/cache

# Expõe a porta padrão do PHP-FPM
EXPOSE 9000

# Rodar o PHP-FPM como processo principal
CMD ["php-fpm"]
