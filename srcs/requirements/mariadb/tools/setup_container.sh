#!/bin/bash

# start mysql service cuz mariadb is not doing it by some reason

# copy config file for mariadb
cat /config/conf/50-server.cnf > /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

db_root_name=$(awk -F= '/db_root_name=/ {print $2}' /run/secrets/db_root_password)
db_root_pwd=$(awk -F= '/db_root_pwd/ {print $2'} /run/secrets/db_root_password)
db_user_name=$(awk -F= '/db_user_name/ {print $2'} /run/secrets/db_password)
db_user_pwd=$(awk -F= '/db_user_pwd/ {print $2'} /run/secrets/db_password)

# https://mariadb.com/kb/en/flush/
echo \
"CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};
CREATE USER IF NOT EXISTS ${db_user_name}@'%' IDENTIFIED BY '${db_user_pwd}';
GRANT ALL PRIVILEGES ON ${MYSQL_DB_NAME}.* TO ${db_user_name}@'%';
FLUSH PRIVILEGES;" > temp_db_data

#TODO: add this line to a file when you will setup global root permissions for each container
#ALTER USER ${db_root_name}@'%' IDENTIFIED BY '${db_root_pwd}';

mysql < temp_db_data

# restart db
mysqladmin -u${db_root_name} -p${db_root_pwd} shutdown
service mysql start

rm temp_db_data

bash
#mysql