#!/bin/bash

oc delete -f clusterrbacconfig.yaml -n default
oc delete -f service-role-admin.yaml
oc delete -f service-role-binding.yaml
oc delete -f service-role-products-view.yaml
