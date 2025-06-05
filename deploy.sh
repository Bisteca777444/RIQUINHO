#!/bin/bash

# Copiar o arquivo .env para o diretório de trabalho
cp /etc/secrets/.env .env

# Instalar dependências do Composer
composer install --no-dev --optimize-autoloader

# Limpar caches
php artisan optimize:clear

# Cache de configurações
php artisan config:cache

# Cache de rotas
php artisan route:cache

# Rodar as migrações
php artisan migrate --force
