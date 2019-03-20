#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "oc apply -f" $1
  oc apply -f $1
  nextstep
  erasestep $1
}

function erasestep {
  echo "oc delete -f" $1
  oc delete -f $1
}

step 'scenario1.yaml'
step 'scenario2.yaml'
step 'scenario3.yaml'
step 'scenario4.yaml'
step 'scenario5.yaml'
step 'scenario6.yaml'
