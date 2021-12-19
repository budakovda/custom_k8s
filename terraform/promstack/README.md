# README

## заметки

- доступ к графане через ингресс при деплое через vagrant

## terraform with k8s

```sh

systemctl start docker
kind create cluster --name=${NAME}

cd /vagrant/examples
kubectl config view --context=${NAME} --raw --output="go-template-file=cluster.tfvars.gotemplate" > main.tf

kubectl port-forward --address localhost,${IP} --namespace ${NS} svc/${GRAFANA} 80:80 >>/dev/null
kubectl port-forward --address localhost,${IP} --namespace ${NS} svc/${PROM} 9090:9090 >>/dev/null
```
