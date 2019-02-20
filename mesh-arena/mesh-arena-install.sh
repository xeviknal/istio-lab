#!/bin/bash

oc login -u admin -p admin
oc new-project mesh-arena

oc adm policy add-scc-to-user privileged -z default
oc apply -f <(./bin/istioctl kube-inject -f ../mesh-arena/full-metrics.yml)
