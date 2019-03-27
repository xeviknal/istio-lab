#!/bin/bash

oc adm policy add-scc-to-user privileged -z default

curl -s https://raw.githubusercontent.com/knative/docs/master/docs/install/scripts/istio-openshift-policies.sh | bash

oc apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio-crds.yaml && \
oc apply --filename https://github.com/knative/serving/releases/download/v0.4.0/istio.yaml

oc get cm istio-sidecar-injector -n istio-system -oyaml | sed -e 's/securityContext:/securityContext:\\n      privileged: true/' | oc replace -f -

while oc get pods -n istio-system | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done
