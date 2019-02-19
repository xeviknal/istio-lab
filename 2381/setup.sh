#!/bin/bash

oc create -f clusterrbacconfig.yaml -n default
oc create -f service-role-admin.yaml
oc create -f service-role-binding.yaml
oc create -f service-role-products-view.yaml
