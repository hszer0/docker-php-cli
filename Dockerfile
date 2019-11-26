FROM php:7.3-cli-alpine

RUN apk update && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS
RUN apk add --no-cache bash freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev zlib-dev libzip-dev
RUN pecl install xdebug-2.7.2
RUN docker-php-ext-install pdo_mysql mysqli gd zip
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN apk del -f .build-deps
