FROM composer:2 AS composer

FROM php:8.3-alpine AS build

RUN mkdir /app

RUN apk update && \
    apk add git && \
    apk cache clean

WORKDIR /app

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
COPY . /app

RUN composer install --no-interaction --no-progress --no-suggest --optimize-autoloader

RUN php -d phar.readonly=0 ./build/create-phar.php

FROM php:8.3-alpine
COPY --from=build /app/release/smtp-info-test.phar /usr/local/bin

ENTRYPOINT ["php", "/usr/local/bin/smtp-info-test.phar"]