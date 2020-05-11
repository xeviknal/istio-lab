#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "kubectl apply -f" $1
  echo $2
  kubectl apply -f $1
  nextstep
}

step 'meshpolicy-right.yaml' 'Partially enabled on autoMTLS=false | Enabled on autoMTLS=true'
step 'dr-right.yaml' 'Mesh-wide mTLS enabled (both autoMtls states)'
step 'dr-partial.yaml' 'Partially enabled on autoMTLS=false | Enabled on autoMTLS=true'
step 'meshpolicy-permissive.yaml' 'tesing'

echo 'Do you want to reset mesh to mTLS?'
read letsee
./mesh-wide-mtls-enabler.sh
