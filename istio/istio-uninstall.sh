#!/bin/bash

oc login -u admin -p admin

echo 'Deleting bookinfo...'
oc delete -f samples/bookinfo/platform/kube/bookinfo.yaml -n bookinfo
./bin/istioctl kube-inject -f ~/code/kiali-commit-conf/step_1_1/generators.yaml | oc delete -n bookinfo -f -

echo 'Deleting istio...'
oc delete -f install/kubernetes/istio-demo-auth.yaml

echo 'Deleting crds...'
for i in install/kubernetes/helm/istio-init/files/crd*yaml; do oc delete -f $i; done
