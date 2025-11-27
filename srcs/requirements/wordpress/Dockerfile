FROM debian:latest

RUN apt-get update && apt-get install \
						wget \
						php \
						php-fpm \
						php-mysqli -y

COPY ./tools/ /config/tools/
WORKDIR /app

CMD ["/config/tools/setup_container.sh"]