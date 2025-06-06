# Usa a imagem oficial PHP 8.2 com Apache
FROM php:8.2-apache

# Instala dependências do sistema e extensões do PHP
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

# Habilita mod_rewrite do Apache (essencial para Laravel)
RUN a2enmod rewrite

# Copia o Composer do container oficial
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Define o diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação para o container
COPY . .

# Instala as dependências do Laravel
RUN composer install --no-dev --optimize-autoloader

# Ajusta permissões
RUN chown -R www-data:www-data storage bootstrap/cache

# Garante que o Laravel use o .htaccess corretamente
RUN chown -R www-data:www-data /var/www/html && chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Variável de ambiente para evitar erros no Artisan
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Aponta o Apache para a pasta `public`
RUN sed -ri -e 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/*.conf

# Expõe a porta 80
EXPOSE 80

# Comando final (Apache em foreground)
CMD ["apache2-foreground"]
