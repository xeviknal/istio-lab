#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "kubectl apply -f" $1
  kubectl apply -f $1
  nextstep
}

step 'meshpolicy-right.yaml'
step 'dr-right.yaml'
step 'dr-partial.yaml'
step 'meshpolicy-permissive.yaml'

echo 'Do you want to reset mesh to mTLS?'
read letsee
./mesh-wide-mtls-enabler.sh
