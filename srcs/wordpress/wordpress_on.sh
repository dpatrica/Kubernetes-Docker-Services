rc-service php-fpm7 start
nginx -g 'daemon off;'
# php -S 0.0.0.0:5050 -t /var/www/wordpress