#!/bin/bash

echo 'Removing route from knative, if exists'
sudo ip route delete $(minishift openshift config view | grep ingressIPNetworkCIDR | sed 's/\r$//' | awk '{print $NF}') via $(minishift ip)
echo 'Stopping minishift'
minishift stop
echo 'Stopping virtual machine KIALI'
sudo virsh destroy kiali
echo 'Removing virtual machine KIALI'
sudo virsh undefine kiali
echo 'Removing .minishift folder'
minishift delete --force --clear-cache
rm -rf ~/.minishift/*
rm -rf ~/.kube
