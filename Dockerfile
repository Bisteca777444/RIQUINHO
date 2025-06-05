# 1. Imagem base PHP (com versões recomendadas)
FROM php:8.2-fpm-alpine

# 2. Variáveis de ambiente para não travar em perguntas interativas no apk
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV NODE_VERSION=20.17.0

# 3. Atualiza apk, instala dependências básicas e extensões PHP
RUN apk update && apk add --no-cache \
    bash \
    curl \
    git \
    zip \
    unzip \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    autoconf \
    build-base \
    shadow \
    openssh-client \
    postgresql-dev \
    libxml2-dev

# 4. Instala extensões PHP necessárias
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd xml

# 5. Instala Composer globalmente
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 6. Instala Node.js 20.17.0 manualmente (pois apk Alpine não tem versão 20)
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64-musl.tar.xz | tar -xJ -C /usr/local --strip-components=1

# 7. Atualiza npm para a última versão
RUN npm install -g npm@latest

# 8. Copia seu projeto para dentro do container
WORKDIR /var/www/html
COPY . .

# 9. Instala dependências PHP com composer
RUN composer install --no-dev --optimize-autoloader

# 10. Instala dependências JS (npm)
RUN npm install

# 11. Builda os assets (se tiver mix, vite, etc)
RUN npm run build

# 12. Ajusta permissões (opcional)
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# 13. Expõe a porta que o Laravel irá rodar
EXPOSE 10000

# 14. Comando para rodar o servidor Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=10000"]
