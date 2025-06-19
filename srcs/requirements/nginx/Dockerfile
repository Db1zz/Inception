FROM debian:buster

WORKDIR /

# Install required packages # && apt-get -y install sudo
RUN apt-get update && apt-get -y install nginx && apt-get -y install openssl

COPY ./conf /config/conf/
COPY ./tools /config/tools/

WORKDIR /config/tools

# Run nginx xd
CMD ["./setup_container.sh"]