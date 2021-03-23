# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/23 01:54:09 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-common mariadb-client openssh openrc
RUN rc-update add sshd
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql
RUN openrc && touch /run/openrc/softlevel

COPY mariadb-server.cnf /etc/my.cnf.d
COPY mysql_on.sh /

VOLUME [ "/var/lib/mysql" ]
RUN chmod +x mysql_on.sh

EXPOSE 3306

CMD sh mysql_on.sh