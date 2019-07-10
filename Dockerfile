FROM ubuntu:18.04

ENV VPN_ENDPOINT="${VPN_ENDPOINT}"

ADD entrypoint.sh /usr/bin

RUN apt-get update && \
    apt-get install -y openvpn paris-traceroute tmux && \
    mkdir /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT /usr/bin/entrypoint.sh

