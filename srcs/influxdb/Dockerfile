FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc
RUN apk add influxdb telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null

# RUN mkdir -p /etc/telegraf
# RUN touch /etc/telegraf/telegraf.conf
# RUN /usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY influxdb_on.sh /
RUN chmod +x influxdb_on.sh

EXPOSE 8086

CMD sh influxdb_on.sh