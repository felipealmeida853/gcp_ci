FROM php:7.3.6-fpm-alpine3.9
RUN apk add bash mysql-client
RUN docker-phppext-install pdo pdo_mysql

WORKDIR /var/www
RUN rm -rf /var/www/html

RUN curl -sS curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

RUN ln -s public html

EXPOSE 9000

ENTRYPOINT [ "php-fpm" ]