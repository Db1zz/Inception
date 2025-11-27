FROM debian:latest

RUN apt-get update && apt-get -y install mariadb-server

WORKDIR /

COPY ./config /config/conf/
COPY ./tools /config/tools/

WORKDIR /config/tools
CMD ["/config/tools/setup_container.sh"]