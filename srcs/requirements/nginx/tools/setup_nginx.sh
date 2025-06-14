#!/bin/bash

# expand variables in nginx.conf
echo 'cat <<END_OF_TEXT'      >  temp.sh
cat "/config/conf/nginx.conf" >> temp.sh
echo 'END_OF_TEXT' 	          >> temp.sh
bash temp.sh > "/config/conf/nginx_expanded.conf"
rm temp.sh

# replace old config with the custom one
cat /config/conf/nginx_expanded.conf > /etc/nginx/nginx.conf

# set nginx daemon off so container wont automatically exit
#nginx -g "daemon off;"

bash