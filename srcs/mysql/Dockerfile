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

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk install mariadb-server php-mysql openrc
RUN rc-update add sshd
RUN openrc && touch /run/openrc/softlevel

EXPOSE 3306

CMD mysql_on.sh