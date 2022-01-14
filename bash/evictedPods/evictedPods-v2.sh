#!/bin/bash
# delete evicted pods with jq

PHASE=Evicted
#PHASE=Running

namespaces=$(kubectl get ns --no-headers=true --output=custom-columns=":.metadata.name")

for NS in ${namespaces}; do
    evictedPods=$(kubectl get pods -n ${NS} --field-selector=status.phase=${PHASE} --no-headers=true --output=custom-columns=":.metadata.name")
    for POD in ${evictedPods}; do
            echo "kubectl delete pods ${POD} -n ${NS}"
            if [ "$1" == "delete" ];then
                echo "delete" 
                #kubectl delete pods ${POD} -n ${NS};
            fi
    done
done
