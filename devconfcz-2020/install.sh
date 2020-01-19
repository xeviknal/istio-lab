#!/bin/zsh

PATH=~/code/istio-lab/istio-1.4.3/bin:$PATH

# Installing Istio 1.4.3
istioctl manifest apply --set profile=demo

# kubernetes edit deployment: version 11 works.
# add namespace, service, enabled, url (istioctl dashboard jaeger)
# Adding Jaeger integration
sleep 10
echo 'tracing: in_cluster_url: "http://jaeger-query.istio-system.svc:16686"'
sleep 10
oc edit configmap kiali -n istio-system
