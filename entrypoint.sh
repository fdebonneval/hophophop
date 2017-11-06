#!/bin/sh

set +ex

mkdir /dev/net
mknod /dev/net/tun c 10 200

openvpn \
   --config /vpn/Windscribe-${VPN_ENDPOINT}.ovpn \
   --auth-user-pass /vpn/vpn.cert_auth
