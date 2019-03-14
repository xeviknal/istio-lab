APP_NS="stalker"

istioctl kube-inject -f stalkers.yaml | oc apply -n $APP_NS -f -
