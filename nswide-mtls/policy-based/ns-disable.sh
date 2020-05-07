#!/bin/sh

oc apply -f ns-dr-tls-disable.yaml -n bookinfo
oc apply -f ns-policy-permissive.yaml -n bookinfo
