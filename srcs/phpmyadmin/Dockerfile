# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: dpatrica <dpatrica@student.21-school.ru    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/07 02:38:31 by dpatrica          #+#    #+#              #
#    Updated: 2021/03/23 04:47:08 by dpatrica         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx wget openrc openssl openssh php7-common php7-iconv php7-json php7-gd php7-curl \
php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql \
php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap \
php7-ctype php7-dom php php7-fpm

RUN rc-update add sshd
RUN openrc && touch /run/openrc/softlevel
RUN mkdir -p /run/nginx

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-all-languages.tar.gz && \ 
tar -xf phpMyAdmin-5.1.0-all-languages.tar.gz && rm -f phpMyAdmin-5.1.0-all-languages.tar.gz && \ 
mv phpMyAdmin-5.1.0-all-languages /var/www/phpMyAdmin && \
chown -R 777 /var/www/phpMyAdmin

RUN openssl req -x509 -nodes -days 14 -newkey rsa:2048 -keyout \
 /etc/ssl/super_server.key -out /etc/ssl/super_server.crt -subj \
 "/C=RF/ST=RT/L=Kazan/O=KekCompany/OU=IT/CN=dpatrica"

COPY conf.inc.php /var/www/phpMyAdmin/
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY phpmyadmin_on.sh /
RUN chmod +x phpmyadmin_on.sh

EXPOSE 5000

CMD sh phpmyadmin_on.sh