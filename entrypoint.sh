#!/bin/sh

set +ex

mkdir /dev/net
mknod /dev/net/tun c 10 200

openvpn \
   --config /vpn/Windscribe-${VPN_TARGET}.ovpn \
   --auth-user-pass /vpn/vpn.cert_auth &
if [ -n "$START_SHELL" ]
  then
    bash
  else
    watch -n 10 paris-traceroute -A ${TRACE_TARGET}
fi
