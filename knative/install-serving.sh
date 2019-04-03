#!/bin/bash

curl -s https://raw.githubusercontent.com/knative/docs/master/docs/install/scripts/knative-openshift-policies.sh | bash

oc apply --filename https://github.com/knative/serving/releases/download/v0.4.1/serving.yaml
oc apply --filename https://raw.githubusercontent.com/knative/serving/v0.4.1/third_party/config/build/clusterrole.yaml

while oc get pods -n knative-build | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done
while oc get pods -n knative-serving | grep -v -E "(Running|Completed|STATUS)"; do sleep 5; done

sudo ip route add $(minishift openshift config view | grep ingressIPNetworkCIDR | sed 's/\r$//' | awk '{print $NF}') via $(minishift ip)
