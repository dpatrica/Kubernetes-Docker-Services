#!/bin/sh

/etc/init.d/sshd start
/etc/init.d/sshd status
nginx -g 'daemon off;'
