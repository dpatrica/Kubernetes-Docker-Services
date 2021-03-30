# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/30 04:07:36 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client openrc
RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null

COPY mariadb-server.cnf /etc/my.cnf
COPY super_base.sql /
COPY restart_mysql.sh /
COPY mysql_on.sh /

RUN chmod +x /mysql_on.sh

EXPOSE 3306

CMD sh mysql_on.sh