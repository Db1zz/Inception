FROM debian:latest

RUN apt-get update && apt-get install \
						wget \
						php \
						php-fpm \
						php-mysqli -y

COPY ./tools/ /config/tools/
RUN /config/tools/download_wp.sh

WORKDIR /app
CMD ["/config/tools/setup_container.sh"]