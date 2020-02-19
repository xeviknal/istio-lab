#! /bin/sh

minikube config set vm-driver kvm2
minikube start --memory=16384 --cpus=4 --kubernetes-version=v1.14.2
