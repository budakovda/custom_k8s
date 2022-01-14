#!/bin/bash
# delete evicted pods with jq

PHASE=Evicted
# PHASE=Running

# only output pods
kubectl get pods --all-namespaces -o json | jq '.items[] | select(.status.phase!=null) | select(.status.phase | contains("'${PHASE}'")) | "kubectl delete pods \(.metadata.name) -n \(.metadata.namespace)"' | cat

# output and delete pods
#kubectl get pods --all-namespaces -o json | jq '.items[] | select(.status.phase!=null) | select(.status.phase | contains("'${PHASE}'")) | "kubectl delete pods \(.metadata.name) -n \(.metadata.namespace)"' | xargs -i bash -c 'echo {} && {}'
