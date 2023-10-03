FROM alpine:3.17

EXPOSE 9000

# All the setup and installation logic
RUN apk update && apk upgrade && apk --no-cache add wget curl php81-fpm php81-mysqli php81-cli php81-phar mariadb-client fcgi

RUN addgroup www && adduser -D -G www php

# Copy configurations
COPY /conf/www.conf /etc/php81/php-fpm.d/www.conf

# WordPress download and setup
RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && tar -xzvf /tmp/wordpress.tar.gz -C /tmp
RUN cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
RUN mkdir -p /var/www/html && cp -a /tmp/wordpress/. /var/www/html && rm -rf tmp/*

# WP-CLI setup
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

# Initialization script
COPY ./conf/script.sh /tmp/script.sh
RUN chmod +x /tmp/script.sh

# The command that'll run when the container starts
CMD ["sh", "/tmp/script.sh"]
