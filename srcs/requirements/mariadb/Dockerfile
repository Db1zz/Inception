FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

WORKDIR /

COPY ./config /config/conf/
COPY ./tools /config/tools/

WORKDIR /config/tools
CMD ["./setup_container.sh"]