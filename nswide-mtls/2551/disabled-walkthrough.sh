#!/bin/bash

function nextstep {
  echo 'Next step?'
  read letssee
}

function step {
  echo "##############"
  echo "kubectl apply -f" $1
  kubectl apply -f $1
  head -1 $1
  nextstep
  erasestep $1
}

function erasestep {
  echo "kubectl delete -f" $1
  kubectl delete -f $1
}

echo '#######################################################################################################'
echo '# Scenarios in this script are for checking validity of the Destination Rule'
echo '# It might make other configs have validations. Consider them, but they are not the target of this test'
echo '# Validation file: business/checkers/destinationrules/disabled_namespacewide_mtls_checker.go'
echo '#######################################################################################################'
step 'scenario1.yaml'
step 'scenario2.yaml'
step 'scenario3.yaml'
step 'scenario31.yaml'
step 'scenario4.yaml'
step 'scenario5.yaml'
step 'scenario6.yaml'
