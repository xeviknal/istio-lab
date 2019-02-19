#!/bin/bash

minishift delete
sudo virsh list --all
sudo virsh destroy kiali
sudo virsh undefine kiali
rm -rf ~/.minishift
