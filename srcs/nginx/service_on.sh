#!/bin/sh

/etc/init.d/sshd start 2>/dev/null
/etc/init.d/sshd status
nginx -g "daemon off;"
