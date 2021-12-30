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
kubectl port-forward --address localhost,${IP} svc/prom-exp-prometheus-postgres-exporter 8080:80 >>/dev/null
```

```
RELEASE_NAME="promstack"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install "${RELEASE_NAME}" prometheus-community/kube-prometheus-stack
kubectl --namespace default get pods -l "release=promstack"
```

## repo

```sh
# stable
helm repo add stable https://charts.helm.sh/stable

# bitname
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install -f values.yaml pg bitnami/postgresql
```

## pmm

<https://www.burlutsky.su/monitoring/prometheus-custom-servicemonitor/>
<https://grafana.com/grafana/dashboards/7901>
<https://grafana.com/grafana/dashboards/12470>
<https://grafana.com/grafana/dashboards/10017>
<https://grafana.com/grafana/dashboards/9628>
10521
4164
12273
9628
455
```

```


## notes
label_values(elasticsearch_indices_docs,cluster)
