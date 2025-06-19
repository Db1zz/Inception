#!/bin/bash
mkdir -p $SSL_PATH
touch $SSL_CRT_PATH
touch $SSL_KEY_PATH

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout $SSL_KEY_PATH -out $SSL_CRT_PATH -subj "/C=DE/ST=Branderburg/L=Berlin/O=42 Berlin/CN=42berlin.de" -days 3650

cat /config/conf/default > /etc/nginx/sites-available/default
nginx -g "daemon off;"