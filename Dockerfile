FROM alpine:latest

ENV VPN_ENDPOINT="${VPN_ENDPOINT}"

ADD entrypoint.sh /usr/bin

RUN apk update && \
    apk add openvpn tmux && \
    chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT /usr/bin/entrypoint.sh

