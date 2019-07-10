FROM ubuntu:18.04

ENV VPN_ENDPOINT="${VPN_ENDPOINT}"

COPY entrypoint.sh /usr/bin

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    openvpn=2.4.4-2ubuntu1.3 \
                    paris-traceroute=0.93+git20160927-1 \
                    tmux=2.6-3ubuntu0.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT ["/usr/bin/entrypoint.sh"]

