#!/bin/bash

eval $(minishift docker-env)
eval $(minishift oc-env)

oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin admin
oc login -u admin -p admin

oc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z default -n istio-system
oc adm policy add-scc-to-user anyuid -z prometheus -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-egressgateway-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-citadel-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-ingressgateway-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-cleanup-old-ca-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-mixer-post-install-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-mixer-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-pilot-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-sidecar-injector-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-galley-service-account -n istio-system
oc adm policy add-scc-to-user anyuid -z istio-security-post-install-account -n istio-system

oc adm policy add-scc-to-user privileged -z default -n bookinfo
oc adm policy add-scc-to-user privileged -z default -n travel-agency
oc adm policy add-scc-to-user privileged -z default -n travel-portal
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:kiali-service-account

for i in install/kubernetes/helm/istio-init/files/crd*yaml; do oc apply -f $i; done
oc apply -f install/kubernetes/istio-demo.yaml

oc expose service prometheus -n istio-system
oc expose service grafana -n istio-system
