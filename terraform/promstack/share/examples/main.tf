module "prometheus-operator" {
  source           = "../modules"
  name             = "promstack"
  create_namespace = true
  value            = fileexists("values.yaml") ? file("values.yaml") : ""
}

module "grafana" {
  source = "../grafana"
}
