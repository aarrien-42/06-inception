wp --info

wp core download --locale=es_ES --allow-root --force

wp config create --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --locale=es_ES --allow-root --skip-check

wp core install --path=/var/www/html --url=$DOMAIN_NAME --title="Esto Funciona!!!" --admin_name=$WP_ADMIN_USER --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email="aarrien@student.42urduliz.com" --skip-email --allow-root

sed -i "s/database_name_here/${MYSQL_DATABASE}/g" /var/www/html/wp-config.php
sed -i "s/username_here/${MYSQL_USER}/g" /var/www/html/wp-config.php
sed -i "s/password_here/${MYSQL_PASSWORD}/g" /var/www/html/wp-config.php
sed -i "s/localhost/${MYSQL_HOST}/g" /var/www/html/wp-config.php

php-fpm81 --nodaemonize
