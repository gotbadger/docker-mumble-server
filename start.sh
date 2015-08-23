#!/bin/bash
set -e
# Options.
DATADIR="/mumble-data"
MUMBLE_INI="${DATADIR}/mumble-server.ini"

# Create default config if it doesn't exist
if [ ! -f "${MUMBLE_INI}" ]; then
  echo "creating config from default"
  cp /mumble-server.ini.default "${MUMBLE_INI}"
fi

# Make sure $DATADIR is owned by mumble user.
chown -R mumble:mumble "$DATADIR"

if [ -n "$SUPW" ]; then
  echo "setting SU password: ${SUPW} -> ${MUMBLE_INI}"
  sudo -u mumble /usr/sbin/murmurd -fg -ini "${MUMBLE_INI}" -supw "${SUPW}"
fi

/usr/bin/supervisord
