# Grafana dashboards as code

## Usage

1. You must add this module to your `main.tf`

```sh
module "grafana" {
  source    = "../grafana"
  namespace = ""

  k8s_host                   = ""
  k8s_cluster_ca_certificate = ""
  k8s_client_certificate = ""
  k8s_client_key         = ""

}
```

2. You can put any .json dashboards in `./dashboards/` path.

```
mv custom.json dashboards/
```
