#!/bin/bash

NAMESPACE=stalker

echo "using NAMESPACE=${NAMESPACE}"
oc delete -f stalkers.yaml
oc delete gateways facebook
oc delete gateways google

echo "Application cleanup successful"
