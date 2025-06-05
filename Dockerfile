FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    unzip \
    zip \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    libpq-dev \
    locales \
    zlib1g-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    pdo pdo_mysql mbstring zip exif pcntl intl gd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
