FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc
RUN apk add influxdb telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null

COPY restart_influx.sh /
COPY influxdb_on.sh /

RUN chmod +x influxdb_on.sh

EXPOSE 8086

VOLUME [ "/var/lib/influxdb" ]

CMD sh influxdb_on.sh