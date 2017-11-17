#!/bin/sh

set -e

CONF_FILE="/etc/Caddyfile"

if [ "$SITE" != "" ]
then
  echo "$SITE {" > $CONF_FILE
else
  head -n 1 /Caddyfile.template > $CONF_FILE
fi

if [ "$TLS_EMAIL" != "" ]
then
  echo "  tls $TLS_EMAIL" >> $CONF_FILE
fi

sed '1d' /Caddyfile.template >> $CONF_FILE

exec "$@"
