#!/bin/zsh

kubectl create namespace travel-agency
kubectl label namespace travel-agency istio-injection=enabled
kubectl apply -f travel_agency.yaml -n travel-agency
kubectl apply -f travel_agency_v2.yaml -n travel-agency

kubectl create namespace travel-portal
kubectl label namespace travel-portal istio-injection=enabled
kubectl apply -f travel_portal.yaml -n travel-portal
