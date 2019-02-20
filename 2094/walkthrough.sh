#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "oc apply -f" $1
  oc apply -f $1
  nextstep
}

step 'dr-port-without-tls.yaml'
step 'dr-without-traffic-policy.yaml'
step 'dr-with-loadbalancing-traffic-policy.yaml'
step 'dr-port-with-mtls.yaml'
step 'dr-port-with-tls.yaml'
step 'dr-with-simple-tls.yaml'
step 'dr-with-mtls.yaml'
