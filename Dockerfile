FROM php:8.3
RUN apt-get update -yqq
RUN apt-get install -y libzip-dev zip wget git procps
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions decimal pdo_pgsql
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
COPY docker/php/xdebug.ini $PHP_INI_DIR/conf.d/xdebug.ini
RUN echo "memory_limit=-1" > $PHP_INI_DIR/conf.d/memory-limit.ini