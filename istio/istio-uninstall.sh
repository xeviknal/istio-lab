#!/bin/bash

oc login -u admin -p admin

echo 'Deleting bookinfo...'
oc delete -f samples/bookinfo/platform/kube/bookinfo.yaml -n bookinfo

echo 'Deleting crds...'
oc delete -f install/kubernetes/helm/istio/templates/crds.yaml

echo 'Deleting istio...'
oc delete -f install/kubernetes/istio-demo.yaml
