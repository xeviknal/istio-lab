#!/bin/sh

kubectl apply -f ns-dr-tls-mutual.yaml
kubectl apply -f ns-policy-strict.yaml
