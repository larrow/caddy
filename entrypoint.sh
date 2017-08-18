#!/bin/sh

set -e

CONF_FILE="/etc/Caddyfile"

if [ "$SITE" != "" ]
then
  echo "$SITE {" > $CONF_FILE
  sed '1d' /Caddyfile.template >> $CONF_FILE
fi

exec "$@"
