#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "##############"
  echo "oc apply -f" $1
  oc apply -f $1
  head -1 $1
  nextstep
  erasestep $1
}

function erasestep {
  echo "oc delete -f" $1
  oc delete -f $1
}

ls *.yaml -l | awk '{PRINT $NF}'

step '001.yaml'
step '002.yaml'
step '003.yaml'
step '101.yaml'
step '102.yaml'
step '103.yaml'
step '104.yaml'
step '105.yaml'
step '106.yaml'
step '107.yaml'
step '108.yaml'
step '109.yaml'
step '110.yaml'
step '201.yaml'
step '401.yaml'
