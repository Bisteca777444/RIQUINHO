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
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
