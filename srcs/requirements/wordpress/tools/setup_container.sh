#!/bin/sh
if [ -z "$( ls -A /usr/local/bin/ | grep "wp" )" ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ -z "$(ls /app -A | grep "index.php")" ]; then
    wp core download --allow-root
fi

wp language core install en_US --activate --allow-root

wp core install \
    --url=$DOMAIN_NAME \
    --title=$SITE_TITLE \
    --admin_user=$WP_ADM_NAME \
    --admin_password=$WP_ADM_PWD \
    --admin_email=$WP_ADM_EMAIL \
    --allow-root

if [ -z "$(find / -name "wp-config.php")" ]; then
    wp config create \
        --dbname=$MYSQL_DB_NAME \
        --dbuser=$DB_USER_NAME \
        --dbpass=$DB_USER_PWD \
        --dbhost=$MYSQL_DB_NAME \
        --locale=en_US \
        --allow-root
fi

wp theme install astra --activate --allow-root
sed -i 's/listen = \/run\/php\/php8.4-fpm.sock/listen = 9000/g' /etc/php/8.4/fpm/pool.d/www.conf
mkdir -p /run/php
mv /usr/sbin/php-fpm* /usr/sbin/php-fpm
php-fpm -F