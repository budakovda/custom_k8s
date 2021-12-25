resource "helm_release" "grafana" {
  name             = var.name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://grafana.github.io/helm-charts"
  chart            = "grafana"
  values           = [file("${path.module}/values.yaml"), var.value]
}
