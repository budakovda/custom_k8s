locals {
  prometheus_operator_values = {
    prometheus = {
    }
    grafana = {
    }
  }
}

resource "helm_release" "prom" {
  name             = var.name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  values           = [file("./values.yaml"), yamlencode(local.prometheus_operator_values), var.value]
}


    // command = <<-EOT
    //   kubectl delete configmaps promstack-kube-prometheus-prometheus -n monitoring
    //   kubectl restart pods -l app.kubernetes.io/name=grafana  -n monitoring
    // EOT
