#!/bin/sh

set -e

CONF_FILE="/etc/Caddyfile"

echo "$SITE {" > $CONF_FILE
sed '1d' /Caddyfile.template >> $CONF_FILE

exec "$@"
