eval $(~/.linuxbrew/bin/brew shellenv)
minikube stop && minikube delete --all
minikube start --driver=docker --extra-config=apiserver.service-node-port-range=1-65535 --cpus 4 --memory 4g

minikube addons enable metallb
minikube addons enable dashboard
minikube addons enable metrics-server

eval $(minikube docker-env)
docker build -t nginx-img srcs/nginx/.
docker build -t mysql-img srcs/mysql/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t ftps-img srcs/ftps/.
docker build -t influxdb-img srcs/influxdb/.
docker build -t grafana-img srcs/grafana/.

kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/mysql/volume.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml

minikube dashboard