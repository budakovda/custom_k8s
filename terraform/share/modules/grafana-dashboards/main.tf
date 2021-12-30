resource "kubernetes_config_map" "grafana-dashboards" {
  for_each = fileset("${var.boards}", "*")
  metadata {
    name      = "${var.name}-${each.value}"
    namespace = var.namespace
    labels    = var.labels
  }
  data = {
    "${each.value}" = "${file("${var.boards}/${each.value}")}"
  }
}
