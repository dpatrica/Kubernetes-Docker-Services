# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/28 01:52:30 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update && apk upgrade
RUN apk add pure-ftpd --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
RUN apk add openrc openssl

RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null
RUN mkdir -p ftps/admin && adduser -D admin
RUN echo admin:admin | chpasswd

RUN openssl req -x509 -nodes -days 14 -newkey rsa:2048 -keyout \
 /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem -subj \
 "/C=RF/ST=RT/L=Kazan/O=KekCompany/OU=IT/CN=dpatrica"
RUN chmod 600 /etc/ssl/private/pure-ftpd.pem

COPY ftps_on.sh /
RUN chmod +x ftps_on.sh

EXPOSE 21 2000 2001

CMD sh ftps_on.sh