#!/bin/sh

/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql -u root -e "CREATE DATABASE super_base; use super_base"
mysql -u root -e "CREATE USER 'loser'@'%' IDENTIFIED BY 'kek'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'loser'@'%'; FLUSH PRIVILEGES;"
rc-update add mariadb default
sh usr/share/mariadb/mysql.server start
tail -f /dev/null