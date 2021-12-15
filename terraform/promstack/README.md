# README

## cheatsheet

```sh
terraform init
terraform fmt
terraform validate
terraform apply
terraform show
terraform state list
terraform apply -var "container_name=YetAnotherName"

terraform destroy -auto-approve
terraform output
```

## заметки

- доступ к графане через ингресс при деплое через vagrant

## links

terraform with k8s tutorial [link](https://learn.hashicorp.com/tutorials/terraform/kubernetes-provider?in=terraform/kubernetes)
terraform modules [link](https://learn.hashicorp.com/tutorials/terraform/module?in=terraform/modules)

## terraform with k8s

```sh

git clone https://github.com/hashicorp/learn-terraform-k8s-crd-openfaas.git
cd learn-terraform-k8s-crd-openfaas
systemctl start docker
kind create cluster --name=openfaas
kubectl config view --context=kind-openfaas --raw --output="go-template-file=cluster.tfvars.gotemplate" > terraform.tfvars
terraform init
terraform apply -auto-approve

kubectl port-forward --address localhost,${IP} --namespace ${NS} \
svc/${grafana} 80:80 >>/dev/null

kubectl port-forward --address localhost,${IP} --namespace ${NS} \
svc/${prom} 9090:9090 >>/dev/null


```

