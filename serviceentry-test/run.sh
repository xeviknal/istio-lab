APP_NS="stalker"

oc new-project stalker
oc adm policy add-scc-to-user privileged -z default -n stalker
oc adm policy add-scc-to-group privileged system:serviceaccounts -n stalker
oc adm policy add-scc-to-group anyuid system:serviceaccounts -n stalker

../istio-1.3.3/bin/istioctl kube-inject -f stalkers.yaml | oc apply -n $APP_NS -f -
