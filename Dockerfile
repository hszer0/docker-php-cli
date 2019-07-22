FROM php:7.3-cli

RUN apt-get update && apt-get install -y $PHPIZE_DEPS \
    && pecl install xdebug-2.7.2 pecl_http \
    && docker-php-ext-install pdo_mysql mysqli \
    && docker-php-ext-enable xdebug mysqli http\
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
