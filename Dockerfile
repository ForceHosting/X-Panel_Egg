FROM node:lts-alpine

LABEL maintainer="The MG <mg@forcehost.net>"

COPY ./entrypoint.sh /entrypoint.sh
COPY ./pterodactyl.json /home/container/pterodactyl.json
RUN apk add --update --no-cache git && \
    adduser -D -h /home/container container && \
    chmod +x /entrypoint.sh

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container


CMD ["/bin/sh","/entrypoint.sh"]