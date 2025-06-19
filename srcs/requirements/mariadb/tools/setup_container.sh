#!/bin/bash

# start mysql service cuz mariadb is not doing it by some reason

# copy config file for mariadb
cat /config/conf/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

# https://mariadb.com/kb/en/flush/
echo \
"CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};
CREATE USER IF NOT EXISTS ${DB_USER_NAME}@'%' IDENTIFIED BY '${DB_USER_PWD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO ${DB_USER_NAME}@'%';
ALTER USER ${DB_ROOT_NAME}@'%' IDENTIFIED BY '${DB_ROOT_PWD}';
FLUSH PRIVILEGES;" > temp_db_data

mysql < temp_db_data

# restart db
mysqladmin -u${DB_ROOT_NAME} -p${DB_ROOT_PWD} shutdown
service mysql start

rm temp_db_data

mysql