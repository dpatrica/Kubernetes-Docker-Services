mkdir -p /usr/share/grafana/data
cp grafana.db /usr/share/grafana/data/
/usr/sbin/grafana-server --homepath=usr/share/grafana
# sleep infinity
# grafana-server -homepath /usr/share/grafana -config /etc/grafana.ini