module "prometheus-operator" {
  source           = "../../modules/grafana"
  name             = "grafana"
  create_namespace = true
  value            = fileexists("values.yaml") ? file("values.yaml") : ""
}
