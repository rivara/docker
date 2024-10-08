FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libmemcached-dev \
    libssl-dev \
    zlib1g-dev \
    zip \
    unzip \
    curl \
    gnupg \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql


# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

        # Instalar Composer
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

    # Instalar Node.js y npm
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && curl -sL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Limpiar la caché de apt
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

#RUN apt-get update && apt-get install -y libmemcached-dev libssl-dev zlib1g-dev \
#	&& pecl install memcached-3.2.0 \
#	&& docker-php-ext-enable memcached

#RUN apt-get install zip unzip \
#    && curl -sS https://getcomposer.org/installer -o composer-setup.php \
#    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
#    && unlink composer-setup.php

RUN echo 'date.timezone="America/Sao_Paulo"' >> /usr/local/etc/php/conf.d/date.ini \
    && echo 'opcache.enable=1' >> /usr/local/etc/php/conf.d/opcache.conf \
    && echo 'opcache.validate_timestamps=1' >> /usr/local/etc/php/conf.d/opcache.conf \
    && echo 'opcache.fast_shutdown=1' >> /usr/local/etc/php/conf.d/opcache

    # Establecer el directorio de trabajo
WORKDIR /var/www

# Exponer el puerto para PHP-FPM
EXPOSE 9000

# Comando predeterminado
CMD ["php-fpm"]