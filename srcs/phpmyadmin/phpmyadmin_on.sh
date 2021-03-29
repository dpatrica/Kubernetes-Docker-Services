rc-service php-fpm7 start
nginx -g 'daemon off;'
# php -S 0.0.0.0:5000 -t /var/www/phpmyadmin
# rc-service nginx start
# sleep infinity