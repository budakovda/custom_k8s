#!/bin/bash

NS=<namespace>
REPO=<custom-repo>

deployments=$(kubectl get deployments -n ${NS} -l "app.kubernetes.io/name=${REPO}" --no-headers=true -o custom-columns=NAME:.metadata.name)
branches=$(git branch -r -l --no-merged  | sed  -e 's/origin\//'${REPO}'-/' -e 's/\//-/' -e 's/$/-server/')

for DP in ${deployments}; do 
    if ! echo ${branches} | grep -qw $DP; then 
        echo kubectl -n ${NS} delete deployment $DP; 
    fi
done
