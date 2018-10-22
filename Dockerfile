# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM frolvlad/alpine-openjdk7

MAINTAINER Pterodactyl Software, <support@pterodactyl.io>

RUN apk update \
    && apk upgrade \
    && apk add bash \
    && apk add --no-cache --update curl ca-certificates openssl git tar bash \
    && adduser -D -h /home/container container

USER container
ENV  USER container
ENV  HOME /home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
