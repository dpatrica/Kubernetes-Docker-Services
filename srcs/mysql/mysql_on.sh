#!/bin/sh

/etc/init.d/mariadb setup
rc-service mariadb start
mysql -u root -e "CREATE DATABASE super_base"
mysql -u root -e "CREATE USER 'loser'@'%' IDENTIFIED BY 'kek'"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'loser'@'%'"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root super_base < super_base.sql
tail -f /dev/null