var=$(grep autoindex /etc/nginx/sites-enabled/nginx.conf)
if [[ ${var} == "		autoindex on;" ]]
then
	sed -i "s/autoindex on;/autoindex off;/" /etc/nginx/sites-enabled/nginx.conf
else
	sed -i "s/autoindex off;/autoindex on;/" /etc/nginx/sites-enabled/nginx.conf
fi
service nginx restart
