FROM alpine:3.18.2

RUN apk update && apk upgrade && apk add --no-cache wget php81 php-fpm81

RUN wget -O /tmp/wordpress.tar.gz https://wordpress.org/latest.tar.gz && tar -xzvf /tmp/wordpress.tar.gz -C /tmp

RUN cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
RUN mkdir -p /var/www/wordpress && cp -a /tmp/wordpress/. /var/www/wordpress && rm -rf /tmp/*

COPY /conf/www.conf /etc/php81/php-fpm.d/www.conf
RUN ls -la /usr/sbin

EXPOSE 9000

CMD ["php-fpm81", "-F", "-R"]