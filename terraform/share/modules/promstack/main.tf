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

resource "kubernetes_config_map" "grafana-dashboards" {
  for_each = fileset("${path.module}/dashboards", "*")
  metadata {
    name      = trimsuffix(format("%.60s-ht", format("%s-%s", trimsuffix("${format("%.26s", "${var.name}-kube-prometheus-stack")}", "-"), trimsuffix(each.value, ".json"))), "-")
    namespace = var.namespace
    labels    = { grafana_dashboard : 1 }
  }
  data = {
    "${each.value}" = "${file("${path.module}/dashboards/${each.value}")}"
  }
}
