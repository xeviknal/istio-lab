#!/bin/bash

echo 'Stopping virtual machine KIALI'
sudo virsh destroy kiali
echo 'Removing virtual machine KIALI'
sudo virsh undefine kiali
echo 'Removing .minishift folder'
minishift delete --force --clear-cache
rm -rf ~/.minishift
rm -rf ~/.kube
