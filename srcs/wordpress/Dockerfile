# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/29 00:35:11 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

RUN apk update && apk upgrade
RUN apk add nginx wget openrc openssh php7-common php7-iconv php7-json php7-gd php7-curl \
php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
php7-ctype php7-dom php php7-fpm

RUN rc-update add sshd
RUN openrc 2>/dev/null && touch /run/openrc/softlevel 2>/dev/null
RUN mkdir -p /run/nginx

RUN wget https://wordpress.org/latest.tar.gz && \
tar -xf latest.tar.gz && rm -rf latest.tar.gz && \
mv wordpress /var/www/wordpress && \
chown -R 777 /var/www/wordpress

COPY wp-config.php /var/www/wordpress/
COPY nginx.conf /etc/nginx/nginx.conf
COPY wordpress_on.sh /
RUN chmod +x wordpress_on.sh

EXPOSE 5050

CMD sh wordpress_on.sh