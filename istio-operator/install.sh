#!/bin/sh

oc adm policy add-cluster-role-to-user cluster-admin admin
oc adm policy add-scc-to-user privileged -z default -n bookinfo

oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:grafana
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:jaeger
oc adm policy add-cluster-role-to-user cluster-admin system:serviceaccount:istio-system:prometheus

oc new-project istio-operator
oc new-project istio-system

oc apply -n istio-operator -f ./deploy/maistra-operator.yaml

sleep 15

oc apply -n istio-system -f deploy/examples/maistra_v1_servicemeshcontrolplane_cr_basic.yaml
