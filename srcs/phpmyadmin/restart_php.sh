if [ $(ps aux | grep php-fpm | grep -v grep | wc -l) == 0 ];
then
    exit 1
fi