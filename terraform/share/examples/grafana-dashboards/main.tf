module "grafana-dashboards" {
  files            = "./dashboards"
  source           = "../../modules/grafana-dashboards"
  name             = "grafana-dashboards"
  namespace        = "example-monitoring"
}
