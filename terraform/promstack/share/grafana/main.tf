resource "kubernetes_config_map" "dashboards" {
  for_each = fileset("${path.module}/dashboards", "*")
  metadata {
    name      = "promstack-kube-prometheus-${trimsuffix(each.value, ".json")}-ht"
    namespace = var.namespace
    labels    = { grafana_dashboard : 1 }
  }
  data = {
    "${each.value}" = "${file("${path.module}/dashboards/${each.value}")}"
  }
}
