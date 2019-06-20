#!/bin/bash

minishift profile set kiali
minishift config set memory 14GB
minishift config set cpus 3
minishift config set vm-driver kvm
minishift config set image-caching true
minishift config set openshift-version v3.11.0
minishift addon enable admin-user
minishift addon enable admissions-webhook
minishift addon disable anyuid

minishift start --show-libmachine-logs -v5
minishift ssh -- sudo setenforce 0
minishift ssh -- sudo sysctl -w vm.max_map_count=262144

sleep 20
minishift addon apply anyuid
