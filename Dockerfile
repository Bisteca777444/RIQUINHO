# Usar a imagem base do Nginx com PHP-FPM
FROM richarvey/nginx-php-fpm:latest

# Instalar dependências do sistema
RUN apk update && \
    apk add --no-cache \
    curl \
    nodejs \
    npm \
    && npm install -g npm@latest

# Definir o diretório de trabalho
WORKDIR /var/www/html

# Copiar os arquivos do projeto para o container
COPY . .

# Instalar dependências do Composer
RUN composer install --no-dev --optimize-autoloader

# Instalar dependências do NPM e buildar os assets
RUN npm install && npm run build

# Configurar variáveis de ambiente
ENV APP_ENV=production
ENV APP_DEBUG=false
ENV LOG_CHANNEL=stderr
ENV COMPOSER_ALLOW_SUPERUSER=1

# Expor a porta 10000
EXPOSE 10000

# Comando para iniciar o servidor
CMD ["/start.sh"]
