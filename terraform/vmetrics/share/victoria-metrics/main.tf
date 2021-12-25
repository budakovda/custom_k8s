resource "helm_release" "vmcluster" {
  name             = "vmcluster"
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://victoriametrics.github.io/helm-charts/"
  chart            = "victoria-metrics-cluster"
  values           = [file("${path.module}/vmcluster.yaml"), var.value]
}

resource "helm_release" "vmagent" {
  name             = "vmagent"
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://victoriametrics.github.io/helm-charts/"
  chart            = "victoria-metrics-agent"
  values           = [file("${path.module}/vmagent.yaml")]
}

resource "helm_release" "vmalert" {
  name             = "vmalert"
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://victoriametrics.github.io/helm-charts/"
  chart            = "victoria-metrics-alert"
  values           = [file("${path.module}/vmalert.yaml")]
}
