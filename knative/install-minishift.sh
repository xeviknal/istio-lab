#!/bin/bash

oc project myproject
oc adm policy add-scc-to-user privileged -z default
oc label namespace myproject istio-injection=enabled
oc label namespace bookinfo istio-injection=enabled
