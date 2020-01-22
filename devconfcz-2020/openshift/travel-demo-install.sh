#!/bin/zsh

oc new-project travel-agency
oc project travel-agency
oc adm policy add-scc-to-user privileged -z default
oc apply -f travel_agency.yaml -n travel-agency
oc apply -f travel_agency_v2.yaml -n travel-agency

oc new-project travel-portal
oc project travel-portal
oc adm policy add-scc-to-user privileged -z default
oc apply -f travel_portal.yaml -n travel-portal
