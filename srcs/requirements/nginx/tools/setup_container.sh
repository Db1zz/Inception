#!/bin/bash

## REMOVE ME
echo " \
export DOMAIN_NAME=gonische.42.fr
export SSL_PATH=/etc/nginx/ssl" \
>> ~/.bashrc && source ~/.bashrc

echo " \
export SSL_KEY_PATH=$SSL_PATH/$DOMAIN_NAME.key \
export SSL_CRT_PATH=$SSL_PATH/$DOMAIN_NAME.crt" \
>> ~/.bashrc && source ~/.bashrc
#

./setup_ssl.sh
./setup_nginx.sh