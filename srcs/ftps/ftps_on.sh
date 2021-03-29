# openrc
# touch /run/openrc/softlevel
# rc-status
chown -R admin:admin /home/admin
/usr/sbin/pure-ftpd -p 2000:2001 -P 192.168.49.56 -Y 2
# sleep infinity