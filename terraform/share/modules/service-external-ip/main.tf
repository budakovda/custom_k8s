resource "helm_release" "service-external-ip" {

  name             = var.name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  chart            = "${path.module}/../../helm-charts/charts/service-external-ip"
  values           = [file("${path.module}/values.yaml"), var.value]
}
