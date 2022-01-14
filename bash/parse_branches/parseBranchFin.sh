#!/bin/bash

NS=<namespace>
SVC=<service>

deployments=$(kubectl get deployments -n ${NS} -l "app.kubernetes.io/name=${SVC}" --no-headers=true -o custom-columns=NAME:.metadata.name)
branches=$(git branch -r -l | sed  -e 's/origin\//mamore-lobster-/' -e 's/\//-/' -e 's/$/-server/')

for DP in ${deployments}; do
    if ! echo ${branches} | grep -qw $DP; then
        release=${DP/-server/""}
        release=${release/mamore-lobster-/""}
        echo helm -n ${NS} uninstall ${release} ;
        if [ "$1" == "uninstall" ];then
            helm -n ${NS} uninstall  ${release};
        fi
    fi
done
