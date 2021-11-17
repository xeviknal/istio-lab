#/bin/zsh

for j in {0..9}
do
  # Create a new namespace
  ns="test-ns-${j}"
  echo $ns
  kubectl create ns $ns

  # Create a new PeerAuthn per namespace
  # echo 'Adding Peer Authentication'
  # kubectl apply -f ./peer-authentication-template.yaml -n $ns

  # Create 100 destination rule per namespace
  cp destination-rule-template.yaml destination-rule-template.temp.yaml
  for i in {0..99}
  do
    echo 'Adding Destination Rule #' + $i
    oldreviews="reviews-v${i}"
    i=$((i+1))
    newreviews="reviews-v${i}"

    sed -i "s/$oldreviews/$newreviews/" destination-rule-template.temp.yaml
    kubectl apply -f ./destination-rule-template.temp.yaml -n $ns
  done
done

rm destination-rule-template.temp.yaml
