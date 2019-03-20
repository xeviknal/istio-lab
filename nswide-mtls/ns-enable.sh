#!/bin/sh

oc apply -f ns-dr-tls-mutual.yaml -n bookinfo
oc apply -f ns-policy-strict.yaml -n bookinfo
