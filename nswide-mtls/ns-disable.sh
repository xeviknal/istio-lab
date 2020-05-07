#!/bin/sh

kubectl apply -f ns-dr-tls-disable.yaml -n bookinfo
kubectl apply -f ns-policy-permissive.yaml -n bookinfo
