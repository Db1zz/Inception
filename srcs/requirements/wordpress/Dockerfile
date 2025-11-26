FROM debian:latest

RUN apt-get update && apt-get install \
						wget \
						php \
						php-fpm \
						php-mysqli -y

COPY ./tools/ /config/tools/
RUN chmod +x /config/tools/setup_container.sh && /config/tools/setup_container.sh

WORKDIR /app
CMD ["/config/tools/run.sh"]