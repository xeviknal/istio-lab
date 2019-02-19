#!/bin/bash

istiooc login -u system:admin
istiooc adm policy add-cluster-role-to-user cluster-admin admin
istiooc login -u admin -p admin

istiooc adm policy add-scc-to-user anyuid -z istio-ingress-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z default -n istio-system
istiooc adm policy add-scc-to-user anyuid -z prometheus -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-egressgateway-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-citadel-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-ingressgateway-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-cleanup-old-ca-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-mixer-post-install-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-mixer-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-pilot-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-sidecar-injector-service-account -n istio-system
istiooc adm policy add-scc-to-user anyuid -z istio-galley-service-account -n istio-system

istiooc adm policy add-scc-to-user privileged -z default -n bookinfo

istiooc apply -f install/kubernetes/istio-demo.yaml

istiooc expose service prometheus -n istio-system
istiooc expose service grafana -n istio-system
