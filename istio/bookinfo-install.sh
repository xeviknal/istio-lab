#!/bin/bash

eval $(minishift docker-env)
eval $(minishift oc-env)

oc login -u admin -p admin
oc adm policy add-scc-to-user privileged -z default -n bookinfo
oc adm policy add-scc-to-group privileged system:serviceaccounts -n bookinfo
oc adm policy add-scc-to-group anyuid system:serviceaccounts -n bookinfo

oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:prometheus
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:jaeger

oc new-project bookinfo
oc apply -f <(./bin/istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml) -n bookinfo
./bin/istioctl kube-inject -f ~/code/istio-lab/kiali-commit-conf/step_1_1/generators.yaml | oc apply -n bookinfo -f -
