while ! nc -z mariadb 3306; do
    sleep 1
done

mkdir -p /var/www/html
cd /var/www/html

wp core download --allow-root

wp config create --path=/var/www/html --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --locale=es_ES --allow-root --skip-check

wp core install --path=/var/www/html --url=localhost --title="INCEPTION" --admin_name=$WP_ADMIN_USER --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email="aarrien@student.42urduliz.com" --skip-email --allow-root

wp theme activate "twentytwentytwo"

cat << EOF > /var/www/html/wp-content/plugins/akismet/.htaccess

RewriteRule ^wp-admin$ http://aarrien.42.fr/wp-login.php [NC,L]

RewriteEngine On
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
RewriteBase /
RewriteRule ^index\.php$ - [L]

RewriteRule ^([_0-9a-zA-Z-]+/)?wp-admin$ $1wp-admin/ [R=301,L]

RewriteCond %{REQUEST_FILENAME} -f [OR]
RewriteCond %{REQUEST_FILENAME} -d
RewriteRule ^ - [L]
RewriteRule ^([_0-9a-zA-Z-]+/)?(wp-(content|admin|includes).*) $2 [L]
RewriteRule ^([_0-9a-zA-Z-]+/)?(.*\.php)$ $2 [L]
RewriteRule . index.php [L]

EOF

php-fpm81 --nodaemonize
