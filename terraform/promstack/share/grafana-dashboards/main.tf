resource "kubernetes_config_map" "dashboards" {
  for_each = fileset("${path.module}/dashboards", "*")
  metadata {
    name      = "a-dashboards-${trimsuffix(each.value, ".json")}"
    namespace = var.namespace
    labels    = { grafana_dashboard : 1 }
  }
  data = {
    "${each.value}" = "${file("${path.module}/dashboards/${each.value}")}"
  }
}
