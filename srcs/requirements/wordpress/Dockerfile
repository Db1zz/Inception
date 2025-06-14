FROM debian:latest

RUN apt-get update && apt-get -y install wordpress

COPY ./tools/ /config/tools/

WORKDIR /config/tools
CMD ["bash"]