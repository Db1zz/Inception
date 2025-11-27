#!/bin/bash
wp language core install en_US --activate --allow-root

wp core install \
    --url=$DOMAIN_NAME \
    --title=$SITE_TITLE \
    --admin_user=$WP_ADM_NAME \
    --admin_password=$WP_ADM_PWD \
    --admin_email=$WP_ADM_EMAIL \
    --allow-root

wp theme install astra --activate --allow-root
sed -i 's/listen = \/run\/php\/php8.4-fpm.sock/listen = 9000/g' /etc/php/8.4/fpm/pool.d/www.conf
mkdir -p /run/php
mv /usr/sbin/php-fpm* /usr/sbin/php-fpm
php-fpm -F