#!/bin/bash -eu

cmd="$1"

/usr/local/bin/setup.sh
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf -n
exit $?
