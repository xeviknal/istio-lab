#!/bin/bash

NAMESPACE=bookinfo

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "##############"
  echo "oc apply -f $1 -n $NAMESPACE"
  oc apply -f $1 -n $NAMESPACE
  nextstep
}

function erasestep {
  echo "oc delete -f $1 -n $NAMESPACE"
  oc delete -f $1 -n $NAMESPACE
}

step 'step1.yaml'
