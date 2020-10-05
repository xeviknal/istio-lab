#/bin/zsh

i=0
while :
do
  echo 'Sidecar Change #' + $i
  oldreviews="reviews-v${i}"
  i=$((i+1))
  newreviews="reviews-v${i}"

  echo 'oldreviews: ' + $oldreviews + ', newreviews: ' + $newreviews
  sed -i "s/$oldreviews/$newreviews/" bind-sidecar.yaml
  kubectl apply -f ./bind-sidecar.yaml
done
