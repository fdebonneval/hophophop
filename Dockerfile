FROM ubuntu:18.04

ENV VPN_ENDPOINT="${VPN_ENDPOINT}"

COPY entrypoint.sh /usr/bin

RUN apt update && \
    apt install -y --no-install-recommends \
                mtr-tiny=0.92-1 \
                netbase=5.4 \
                openvpn=2.4.4-2ubuntu1.3 \
                paris-traceroute=0.93+git20160927-1 \
                python3-pip=9.0.1-2.3~ubuntu1.18.04.1 \
                runit=2.1.2-9.2ubuntu1 \
                tmux=2.6-3ubuntu0.2 && \
    apt clean && \
    pip3 install traceflow && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir /dev/net && \
    mknod /dev/net/tun c 10 200 && \
    chmod +x /usr/bin/entrypoint.sh


ENTRYPOINT ["/usr/bin/entrypoint.sh"]

