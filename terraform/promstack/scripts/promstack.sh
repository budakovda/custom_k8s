#!/bin/bash

# yum
yum -y install \
git

# docker
sudo yum check-update
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker root
sudo systemctl start docker
sudo systemctl enable docker

# terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
terraform -install-autocomplete

# helm, https://helm.sh/docs/intro/install/
wget -q https://get.helm.sh/helm-v3.7.2-linux-386.tar.gz
tar -zxvf helm-v3.7.2-linux-386.tar.gz
mv linux-386/helm /usr/bin/

# kind, https://kind.sigs.k8s.io/docs/user/quick-start/#installation
curl -s -Lo ./kind https://kind.sigs.k8s.io/dl/v0.11.1/kind-linux-amd64
chmod +x ./kind
mv ./kind /usr/bin/

# kubectl
curl -s -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
mv ./kubectl /usr/bin/

# stand
kind create cluster --name="${NAME}"
cd /vagrant/examples || exit
# kubectl config view --context="${NAME}" --raw --output="go-template-file=cluster.tfvars.gotemplate" > main.tf
kubectl create ns "${NS}"
terraform init
terraform apply -auto-approve

# forward
kubectl port-forward --address localhost,"${IP}" --namespace "${NS}" svc/"${GRAFANA}" 80:80 >>/dev/null &
kubectl port-forward --address localhost,"${IP}" --namespace "${NS}" svc/"${PROM}" 9090:9090 >>/dev/null &
