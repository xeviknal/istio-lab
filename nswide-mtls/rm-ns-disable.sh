#!/bin/sh

oc delete -f ns-dr-tls-disable.yaml -n bookinfo
oc delete -f ns-policy-permissive.yaml -n bookinfo
