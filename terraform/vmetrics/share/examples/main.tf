module "vmcluster" {
  source           = "../victoria-metrics"
  name             = "vm"
  create_namespace = true
  # value            = fileexists("vmetrics.yaml") ? file("vmetrics.yaml") : ""
}

module "grafana" {
  source           = "../grafana"
  name             = "grafana"
  create_namespace = true
  # value            = fileexists("grafana.yaml") ? file("grafana.yaml") : ""
}
