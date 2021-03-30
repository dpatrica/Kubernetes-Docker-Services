mkdir -p /etc/telegraf && touch /etc/telegraf/telegraf.conf
/usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf
/etc/init.d/telegraf start &
telegraf start &
/usr/sbin/influxd -config /etc/influxdb.conf
telegraf &