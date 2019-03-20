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

step 'scenario10.yaml'
step 'scenario11.yaml'
step 'scenario12.yaml'
step 'scenario13.yaml'
step 'scenario14.yaml'
