// include {
//   path = find_in_parent_folders()
// }

terraform {
  source = "/vagrant//modules/grafana-dashboards"

}

inputs = {
  boards             = "${get_terragrunt_dir()}/dashboards"
  name              = "${basename(get_terragrunt_dir())}"
  namespace         = "monitoring"
  labels            = { grafana_dashboard : 1 }
}
