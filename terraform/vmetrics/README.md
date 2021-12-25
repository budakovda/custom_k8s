# vmetrics

<https://github.com/VictoriaMetrics/helm-charts#for-helm-v2>

## vmalert

[vmalert](https://github.com/VictoriaMetrics/helm-charts/tree/master/charts/victoria-metrics-alert)  


## repositories

```sh
helm repo add vm https://victoriametrics.github.io/helm-charts/
helm repo add grafana https://grafana.github.io/helm-charts
helm search repo vm/
```

# port forward
```
SVC_NAME=$(kubectl get svc --namespace "${NS}" -l "app=vmselect" -o jsonpath="{.items[0].metadata.name}")
kubectl --namespace "${NS}" port-forward --address localhost,"${IP}" svc/"${SVC_NAME}" 8481

kubectl port-forward --address localhost,"${IP}" --namespace "${NS}" svc/"${GRAFANA}" 80:80 >>/dev/null &

SVC_ALERT=
kubectl port-forward --address localhost,"${IP}" --namespace ${NS} svc/${SVC_ALERT} 8880:8880 >>/dev/null
```

## set vmalert

<https://github.com/VictoriaMetrics/VictoriaMetrics/tree/master/app/vmalert>
