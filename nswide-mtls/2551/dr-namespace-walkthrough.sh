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

echo '####################################################################################################'
echo '# TARGET: DestinationRule. Scenarios in this script are for checking validity of the Destination Rule'
echo '# It might make other configs have validations. Consider them, but they are not the target of this test'
echo '# Validation file: business/checkers/destinationrules/namespacewide_mtls_checker.go'
echo '####################################################################################################'
step 'scenario10.yaml'
step 'scenario11.yaml'
step 'scenario12.yaml'
step 'scenario13.yaml'
step 'scenario14.yaml'
