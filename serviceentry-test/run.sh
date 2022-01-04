APP_NS="stalker"

kubectl create ns stalker

../istio-1.11.3/bin/istioctl kube-inject -f stalkers.yaml | kubectl apply -n $APP_NS -f -
kubectl apply -n $APP_NS -f gateway-facebook.yaml
kubectl apply -n $APP_NS -f gateway-google.yaml
