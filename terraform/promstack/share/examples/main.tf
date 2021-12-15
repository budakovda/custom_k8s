module "prometheus-operator" {
  source                     = "../modules"
  name                       = ""
  namespace                  = ""
  create_namespace           = true
  value                      = fileexists("values.yaml") ? file("values.yaml") : ""
  k8s_host                   = ""
  k8s_cluster_ca_certificate = ""
  k8s_client_certificate     = ""
  k8s_client_key             = ""
}