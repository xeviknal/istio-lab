#!/bin/zsh

PATH=~/code/istio-lab/istio-1.4.3/bin:$PATH
export CONSOLE_VERSION=local
export AUTH_STRATEGY=openshift
export CLUSTER_TYPE=openshift

# Installing Istio 1.4.3
istioctl manifest apply --set profile=demo

# kubernetes edit deployment: version 11 works.
# add namespace, service, enabled, url (istioctl dashboard jaeger)
# Adding Jaeger integration
sleep 10
echo 'tracing: in_cluster_url: "http://jaeger-query.istio-system.svc:16686"'
cat <<EOD
config.yaml: "istio_component_namespaces:\n  grafana: istio-system\n  tracing: istio-system\n
    \ pilot: istio-system\n  prometheus: istio-system\nistio_namespace: istio-system\ndeployment:\n
    \ accessible_namespaces: ['**']\nserver:\n  port: 20001\n  web_root: /kiali\nexternal_services:\n
    \ istio:\n    url_service_version: http://istio-pilot.istio-system:8080/version\n
    \ tracing:\n    namespace: istio-system\n     url: http://localhost:38413/jaeger\n    in_cluster_url: http://jaeger-query.istio-system.svc:16686\n
    \ grafana:\n    url: \n  prometheus:\n    url: http://prometheus.istio-system:9090\n"
EOD
sleep 10
k edit configmap kiali -n istio-system
