# Grafana dashboards as code

## Usage

1. You must add this module to your `main.tf`

```sh
module "grafana-dashboards" {
  source = "../grafana"
}
```

2. You can put any .json dashboards in `./dashboards/` path.

```
mv custom.json dashboards/
```
