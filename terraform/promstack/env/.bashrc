#!/bin/bash
# shellcheck disable=SC1091

# Source global definitions
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

export NAME="promstack"
export IP="192.168.56.101"
export NS="monitoring"
export GRAFANA="${NAME}-grafana"
export PROM="${NAME}-kube-prometheus-prometheus"

alias init="terraform init"
alias apply="terraform apply -auto-approve"
alias destroy="terraform destroy -auto-approve"
alias clean="rm -rf .terraform *.tfstate*"

conf() { if [ -n "$1" ]; then kubectl describe configmaps "$1" -n ${NS}; else kubectl get configmaps -n ${NS}; fi; }
exec() { kubectl exec -it "$(kubectl get pods -n ${NS} --no-headers=true -o custom-columns=NAME:.metadata.name | grep "$1")" -n ${NS} -- sh; }
list() { if [ -n "$1" ]; then kubectl get pods --no-headers=true -o custom-columns=NAME:.metadata.name -n ${NS} | grep "$1"; else kubectl get pods --no-headers=true -o custom-columns=NAME:.metadata.name -n ${NS}; fi; }

complete -C /usr/bin/terraform terraform
