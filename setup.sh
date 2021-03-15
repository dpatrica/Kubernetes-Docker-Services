#!/bin/sh

minikube stop && minikube delete --all
docker system prune -a -f
minikube start --driver=docker --extra-config=apiserver.service-node-port-range=1-65535
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
docker build -t nginx srcs/nginx/.
echo "kek_nginx is keked!"

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl apply -f srcs/metallb/metallb.yaml
kubectl apply -f srcs/nginx/nginx.yaml

kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system

kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f - -n kube-system
