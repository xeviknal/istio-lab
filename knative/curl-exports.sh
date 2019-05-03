#!/bin/sh

eval $(minishift docker-env) && eval $(minishift oc-env)

sudo ip route add $(minishift openshift config view | grep ingressIPNetworkCIDR | sed 's/\r$//' | awk '{print $NF}') via $(minishift ip)
export DOMAIN=$(oc get route -n istio-system istio-ingressgateway --output=custom-columns=ROUTE:.spec.host | grep -v ROUTE | sed "s/istio-ingressgateway-istio-system.//g")
export IP_ADDRESS=$(oc get svc istio-ingressgateway -n istio-system -o 'jsonpath={.status.loadBalancer.ingress[0].ip}')

curl -v -H "Host: helloworld-go.knative-examples.knative.${DOMAIN}" http://$IP_ADDRESS
