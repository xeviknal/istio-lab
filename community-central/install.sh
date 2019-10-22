#! /bin/bash

oc adm policy add-scc-to-group privileged system:serviceaccounts -n travel-agency
oc adm policy add-scc-to-group anyuid system:serviceaccounts -n travel-agency

oc adm policy add-scc-to-group privileged system:serviceaccounts -n travel-portal
oc adm policy add-scc-to-group anyuid system:serviceaccounts -n travel-portal

oc create namespace travel-agency
oc label namespace travel-agency istio-injection=enabled

oc create namespace travel-portal
oc label namespace travel-portal istio-injection=enabled

oc delete meshpolicies default -n istio-system
oc apply -f travel-portal-mtls.yaml

# V1, the sane one
oc apply -f <(curl -L https://git.io/fjoH0) -n travel-agency
oc apply -f <(curl -L https://git.io/fjoQ1) -n travel-portal

# V2, the chaos monkey.
oc apply -f <(curl -L https://git.io/fjo7s) -n travel-agency

bash <(curl -L https://git.io/getLatestKialiOperator) --accessible-namespaces '**'

sleep 10
# Adding Jaeger integration
echo 'tracing: in_cluster_url: "http://jaeger-query.istio-system.svc:16686"'
oc edit kiali kiali -n kiali-operator
