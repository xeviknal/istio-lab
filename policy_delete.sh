#!/bin/bash

echo 'Install Basic Authentication Policy sample - https://istio.io/docs/tasks/security/authn-policy'

echo 'Deleting foo...'
oc delete -f <(istioctl kube-inject -f samples/httpbin/httpbin.yaml) -n foo
oc delete -f <(istioctl kube-inject -f samples/sleep/sleep.yaml) -n foo
oc delete ns foo

echo 'Deleting bar...'
oc delete -f <(istioctl kube-inject -f samples/httpbin/httpbin.yaml) -n bar
oc delete -f <(istioctl kube-inject -f samples/sleep/sleep.yaml) -n bar
oc delete ns bar

echo 'Deleting legacy...'
oc delete -f samples/sleep/sleep.yaml -n legacy
oc delete ns legacy

echo 'Probatory oneliner'
for from in "foo" "bar" "legacy"; do for to in "foo" "bar"; do oc exec $(oc get pod -l app=sleep -n ${from} -o jsonpath={.items..metadata.name}) -c sleep -n ${from} -- curl http://httpbin.${to}.svc:8000/ip -s -o /dev/null -w "sleep.${from} to httpbin.${to}.svc: %{http_code}\n"; done; done

