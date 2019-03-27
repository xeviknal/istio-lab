#!/bin/bash

# This is needed to install knative serving.
# You gotta replace the previous route and add this new one.
sudo ip route add $(minishift openshift config view | grep ingressIPNetworkCIDR | sed 's/\r$//' | awk '{print $NF}') via $(minishift ip)
