#!/bin/bash
# shellcheck disable=2086

NS=svc-b2b-frontend
SVC=front-sellers

deployments=$(kubectl get deployments -n ${NS} -l "app.kubernetes.io/name=${SVC}" --no-headers=true -o custom-columns=NAME:.metadata.name)
branches=$(git branch -r -l | sed  -e 's/origin\//front-sellers-/' -e 's/\//-/' -e 's/$/-server/')

for DP in ${deployments}; do
    if ! echo ${branches} | grep -qw $DP; then
        echo helm -n ${NS} uninstall  ${DP/-server/""};
        if [ "$1" == "uninstall" ];then
            echo 1helm -n ${NS} uninstall  ${DP/-server/""};
        fi
    fi
done
