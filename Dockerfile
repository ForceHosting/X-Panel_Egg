FROM node:16-alpine

LABEL maintainer="The MG <mg@forcehost.net>"

COPY ./entrypoint.sh /entrypoint.sh

RUN apk add --update --no-cache git && \
    adduser -D -h /home/container container && \
    chmod +x /entrypoint.sh

USER container
ENV HOME=/home/container USER=container
WORKDIR /home/container


CMD ["/bin/sh","/entrypoint.sh"]