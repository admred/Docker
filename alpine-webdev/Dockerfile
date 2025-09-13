FROM alpine-base

RUN apk add sudo \
    screen \
    composer \
    php83-gd \
    php83-pdo_sqlite \
    php83-session \
    phpunit \
    sqlite \
    php83-posix \
    php83-pcntl \
    php83-phpdbg

RUN mkdir -p /var/www/html && chgrp -R www-data /var/www

COPY index.php /var/www/html

EXPOSE 8080/tcp

WORKDIR "/var/www/html"

CMD ["/usr/bin/php","-S","0.0.0.0:8080","-t","/var/www/html"]
