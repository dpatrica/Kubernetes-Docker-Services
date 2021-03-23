#!/bin/sh

# docker system prune -a -f
# minikube addons enable metallb
eval $(minikube docker-env)
# kubectl delete -f srcs/metallb/metallb.yaml
# kubectl delete -f srcs/nginx/nginx.yaml
# kubectl delete -f srcs/mysql/mysql.yaml
# kubectl delete -f srcs/mysql/volume.yaml
# kubectl delete -f srcs/mysql/wordpress.yaml
# kubectl delete -f srcs/mysql/phpmyadmin.yaml
# kubectl delete -f srcs/mysql/ftps.yaml
# kubectl delete deploy nginx-dep
# kubectl delete service nginx-scv
# kubectl delete deploy mysql-dep
# kubectl delete service mysql-svc
# kubectl delete deploy wordpress-dep
# kubectl delete service wordpress-svc
# kubectl delete deploy phpmyadmin-dep
# kubectl delete service phpmyadmin-svc
# kubectl delete deploy ftps-dep
# kubectl delete service ftps-svc
# kubectl delete pods --all
# docker rmi $(docker images)
minikube stop && minikube delete --all && docker system prune -a -f
minikube start --driver=docker --extra-config=apiserver.service-node-port-range=1-65535
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
docker build -t nginx-img srcs/nginx/.
echo "kek_nginx is keked!"
docker build -t mysql-img srcs/mysql/.
docker build -t wordpress-img srcs/wordpress/.
docker build -t phpmyadmin-img srcs/phpmyadmin/.
docker build -t ftps-img srcs/ftps/.

# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/volume.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/ftps/ftps.yaml
# minikube dashboard

# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

# kubectl get configmap kube-proxy -n kube-system -o yaml | \
# sed -e "s/strictARP: false/strictARP: true/" | \
# kubectl diff -f - -n kube-system

# kubectl get configmap kube-proxy -n kube-system -o yaml | \
# sed -e "s/strictARP: false/strictARP: true/" | \
# kubectl apply -f - -n kube-system
