FROM alpine

RUN apk update && apk upgrade
RUN apk add openrc
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null

COPY grafana.db /

COPY grafana_on.sh /
RUN chmod +x grafana_on.sh

CMD sh grafana_on.sh