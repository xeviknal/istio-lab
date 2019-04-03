#!/bin/bash

eval $(minishift docker-env)
eval $(minishift oc-env)

oc login -u admin -p admin
oc adm policy add-scc-to-user privileged -z default -n bookinfo
oc new-project bookinfo
oc apply -f <(./bin/istioctl kube-inject -f samples/bookinfo/platform/kube/bookinfo.yaml) -n bookinfo
./bin/istioctl kube-inject -f ~/code/kiali-commit-conf/step_1_1/generators.yaml | oc apply -n bookinfo -f -
