if [ -z "$( ls -A /usr/local/bin/ | grep "wp" )" ]; then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

if [ -z "$(ls /app -A | grep "index.php")" ]; then
    wp core download --allow-root
fi

if [ -z "$(find / -name "wp-config.php")" ]; then
    wp config create \
        --dbname=$MYSQL_DB_NAME \
        --dbuser=$DB_USER_NAME \
        --dbpass=$DB_USER_PWD \
        --dbhost=$MYSQL_DB_NAME \
        --locale=en_US \
        --allow-root
fi