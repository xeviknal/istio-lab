#!/bin/bash

oc login -u admin -p admin

echo 'Deleting bookinfo...'
oc delete -f samples/bookinfo/platform/kube/bookinfo.yaml -n bookinfo
./bin/istioctl kube-inject -f ~/code/kiali-commit-conf/step_1_1/generators.yaml | oc delete -n bookinfo -f -

echo 'Deleting istio...'
oc delete -f install/kubernetes/istio-demo-auth.yaml

echo 'Deleting crds...'
for i in install/kubernetes/helm/istio-init/files/crd*yaml; do oc delete -f $i; done

echo 'Uninstall operator and kiali'
bash <(curl -L https://git.io/getLatestKialiOperator) --uninstall-mode true

echo 'Kicking the tires'
oc patch kiali kiali -n kiali-operator -p '{"metadata":{"finalizers": []}}' --type=merge
