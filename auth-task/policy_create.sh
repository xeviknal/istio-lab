#!/bin/bash

echo 'Install Basic Authentication Policy sample - https://istio.io/docs/tasks/security/authn-policy'

echo 'Creating foo...'
oc create ns foo
oc adm policy add-scc-to-user privileged -z default -n foo
oc apply -f <(./bin/istioctl kube-inject -f samples/httpbin/httpbin.yaml) -n foo
oc apply -f <(./bin/istioctl kube-inject -f samples/sleep/sleep.yaml) -n foo

echo 'Creating bar...'
oc create ns bar
oc adm policy add-scc-to-user privileged -z default -n bar
oc apply -f <(./bin/istioctl kube-inject -f samples/httpbin/httpbin.yaml) -n bar
oc apply -f <(./bin/istioctl kube-inject -f samples/sleep/sleep.yaml) -n bar

echo 'Creating legacy...'
oc create ns legacy
oc adm policy add-scc-to-user privileged -z default -n legacy
oc apply -f samples/sleep/sleep.yaml -n legacy

sleep 15

echo 'Probatory oneliner'
for from in "foo" "bar" "legacy"; do for to in "foo" "bar"; do oc exec $(oc get pod -l app=sleep -n ${from} -o jsonpath={.items..metadata.name}) -c sleep -n ${from} -- curl http://httpbin.${to}.svc:8000/ip -s -o /dev/null -w "sleep.${from} to httpbin.${to}.svc: %{http_code}\n"; done; done

