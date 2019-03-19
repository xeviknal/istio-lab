#!/bin/bash

oc apply -f clusterrbacconfig.yaml -n default
oc apply -f service-role-admin.yaml
oc apply -f service-role-binding.yaml
oc apply -f service-role-products-view.yaml
