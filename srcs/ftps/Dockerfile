# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/23 06:14:30 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

ENV ip=192.168.99.115

RUN apk update && apk upgrade
RUN apk add pure-ftpd openrc openssl openssh

RUN rc-update add sshd
RUN openrc && touch /run/openrc/softlevel
RUN mkdir -p ftps/admin && adduser -D admin
RUN echo admin:admin | chpasswd

RUN openssl req -x509 -nodes -days 14 -newkey rsa:2048 -keyout \
 /etc/ssl/super_server.pem -out /etc/ssl/super_server.pem -subj \
 "/C=RF/ST=RT/L=Kazan/O=KekCompany/OU=IT/CN=dpatrica"
RUN chmod 600 /etc/ssl/super_server.pem

COPY ftps_on.sh /
RUN chmod +x ftps_on.sh

EXPOSE 21

CMD sh ftps_on.sh