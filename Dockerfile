FROM php:7.3-cli-alpine

RUN apk update && apk add --no-cache $PHPIZE_DEPS
RUN apk add --no-cache bash curl libcurl curl-dev zlib zlib-dev icu-dev
RUN pecl install raphf propro xdebug-2.7.2
RUN docker-php-ext-enable raphf propro
RUN pecl install pecl_http-3.2.0
RUN echo -e "extension=raphf.so\nextension=propro.so\nextension=http.so" > /usr/local/etc/php/conf.d/docker-php-ext-http.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-raphf.ini \
    && rm -rf /usr/local/etc/php/conf.d/docker-php-ext-propro.ini
RUN docker-php-ext-install pdo_mysql mysqli
RUN docker-php-ext-enable xdebug
RUN echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
