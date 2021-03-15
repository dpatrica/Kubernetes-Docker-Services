# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/09 05:07:33 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:latest

RUN echo "root:admin" | chpasswd
RUN apk update && apk upgrade
RUN apk add nginx openssl openssh openrc
RUN rc-update add sshd
RUN openrc && touch /run/openrc/softlevel
# -q -l --progress
# supervisor

RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY sshd_config /etc/ssh/

# COPY nginx.conf /etc/nginx/sites-enabled/

RUN openssl req -x509 -nodes -days 14 -newkey rsa:2048 -keyout \
 /etc/ssl/super_server.key -out /etc/ssl/super_server.crt -subj \
 "/C=RF/ST=RT/L=Kazan/O=KekCompany/OU=IT/CN=dpatrica"

COPY service_on.sh .
RUN chmod +x service_on.sh

# COPY /srcs/autoindex.sh .

EXPOSE 80 443 22

CMD sh service_on.sh
