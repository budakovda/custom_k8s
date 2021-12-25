terraform {
  source = "/vagrant//modules/service-external-ip"

}

inputs = {
  name              = "${basename(get_terragrunt_dir())}"
  namespace         = "example-monitoring"
  create_namespace  = "true"
  value             = fileexists("values-live.yaml") ? file("values-live.yaml") : ""
}
