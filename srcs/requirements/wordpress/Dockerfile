FROM debian:latest

RUN apt-get update && apt-get install -y wget

COPY ./tools/ /config/tools/

WORKDIR /app
CMD ["/config/tools/setup_container.sh"]