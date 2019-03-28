#!/bin/bash

oc project myproject
oc label namespace myproject istio-injection=enabled
oc apply -f hello-world.yaml

while oc get pods | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done

INGRESSGATEWAY=istio-ingressgateway
export IP_ADDRESS=$(oc get svc $INGRESSGATEWAY -n istio-system -o 'jsonpath={.status.loadBalancer.ingress[0].ip}')
curl -H "Host: helloworld-go.myproject.example.com" http://$IP_ADDRESS
