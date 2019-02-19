#!/bin/bash

i=0

while true
do
  echo "Loop #${i}"
  for from in "foo" "bar" "legacy"
  do
    for to in "foo" "bar" "legacy"
    do
      oc exec $(oc get pod -l app=sleep -n ${from} -o jsonpath={.items..metadata.name}) -c sleep -n ${from} -- curl http://httpbin.${to}.svc:8000/ip -o /dev/null -s -w "sleep.${from} to httpbin.${to}.svc: %{http_code}\n"
    done
  done
  i=$[$i+1]
done
