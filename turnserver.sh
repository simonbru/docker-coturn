#!/bin/sh
IP_FILE=/tmp/external_ip
if [ ! -f "$IP_FILE" ]; then
  if [ -z "$EXTERNAL_IP" ]; then
    curl -sS http://whatismyip.akamai.com >$IP_FILE || exit $?
  else
    echo $EXTERNAL_IP > $IP_FILE
  fi
fi
exec /usr/bin/turnserver -c /conf/turnserver.conf \
  --external-ip `cat $IP_FILE` \
  "${@}"
