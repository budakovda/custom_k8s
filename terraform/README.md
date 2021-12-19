# README

## aliases

```sh
alias init="terraform init"
alias apply="terraform apply -auto-approve"
alias clean="rm -rf .terraform *.tfstate*"
conf() { if ! [ -z $1 ]; then kubectl describe configmaps $1 -n ${NS}; else kubectl get configmaps -n ${NS}; fi; }
exec() { kubectl exec -it $(kubectl get pods -n ${NS} --no-headers=true -o custom-columns=NAME:.metadata.name | grep $1) -n ${NS} -- sh; }
list() { if ! [ -z $1 ]; then kubectl get pods --no-headers=true -o custom-columns=NAME:.metadata.name -n ${NS} | grep $1; else kubectl get pods --no-headers=true -o custom-columns=NAME:.metadata.name -n ${NS}; fi; }
```

## cheatsheet

```sh
terraform fmt
terraform validate
terraform show
terraform state list
terraform apply -var "container_name=YetAnotherName"
terraform output
```

## links

terraform with k8s tutorial [link](https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider?in=terraform/kubernetes)
terraform modules [link](https://learn.hashicorp.com/tutorials/terraform/module?in=terraform/modules)
terraform func's [link](https://www.terraform.io/language/functions/trimsuffix)
terraform resources [link](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/config_map#labels)
