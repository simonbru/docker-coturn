#!/bin/sh
if [ ! -f "/external_ip" ]; then
  if [ -z "$EXTERNAL_IP" ]; then
    curl -sS http://whatismyip.akamai.com >/external_ip || exit $?
  else
    echo $EXTERNAL_IP > /external_ip
  fi
fi
exec /usr/bin/turnserver -c /conf/turnserver.conf \
  --external-ip `cat /external_ip` \
  "${@}"
