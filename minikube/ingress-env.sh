#!/bin/zsh

echo "export INGRESS_HOST=$(minikube ip)"
echo "export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')"
echo "export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')"
echo "export GATEWAY_URL=$(echo "$INGRESS_HOST:$INGRESS_PORT")"
echo '# eval $(./ingress-env.sh)'
