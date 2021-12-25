module "prometheus-operator" {
  source           = "../../modules/promstack"
  name             = "promstack"
  create_namespace = true
  value            = fileexists("values.yaml") ? file("values.yaml") : ""
}
