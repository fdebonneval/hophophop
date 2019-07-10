FROM ubuntu:18.04

ENV VPN_ENDPOINT="${VPN_ENDPOINT}"

ADD entrypoint.sh /usr/bin

RUN apt-get update && \
    apt-get install openvpn paris-traceroute tmux && \
    chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT /usr/bin/entrypoint.sh

