module "grafana-dashboards" {
  source    = "../grafana-dashboards"
  name      = var.name
  namespace = var.namespace
}

resource "kubernetes_namespace" "openfaas" {
  lifecycle {
    ignore_changes = [metadata]
  }

  metadata {
    name = "openfaas"
    labels = {
      role            = "openfaas-system"
      access          = "openfaas-system"
      istio-injection = "enabled"
    }
  }
}

resource "kubernetes_namespace" "openfaas-fn" {
  lifecycle {
    ignore_changes = [metadata]
  }

  metadata {
    name = "openfaas-fn"
    labels = {
      role            = "openfaas-fn"
      istio-injection = "enabled"
    }
  }
}



# Need to wait a few seconds when removing the openfaas resource to give helm
# time to finish cleaning up.
#
# Otherwise, after `terraform destroy`:
# │ Error: uninstallation completed with 1 error(s): uninstall: Failed to purge
#   the release: release: not found

resource "time_sleep" "wait_30_seconds" {
  depends_on = [kubernetes_namespace.openfaas]

  destroy_duration = "30s"
}

locals {
  prometheus_operator_values = {
    prometheus = {
    }
    grafana = {
    }
  }
}

resource "helm_release" "openfaas" {
  name             = var.name
  namespace        = var.namespace
  create_namespace = var.create_namespace
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  values           = [file("./values.yaml"), yamlencode(local.prometheus_operator_values), var.value]


  depends_on = [time_sleep.wait_30_seconds]

  set {
    name  = "functionNamepsace"
    value = "openfaas-fn"
  }

  set {
    name  = "generateBasicAuth"
    value = "true"
  }

  set {
    name  = "operator.create"
    value = "true"
  }
}
