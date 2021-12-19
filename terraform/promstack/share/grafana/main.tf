terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.6.1"
    }
  }
}

provider "kubernetes" {
  host = var.k8s_host

  client_certificate     = base64decode(var.k8s_client_certificate)
  client_key             = base64decode(var.k8s_client_key)
  cluster_ca_certificate = base64decode(var.k8s_cluster_ca_certificate)
}

resource "kubernetes_config_map" "dashboards" {
  for_each = fileset("${path.module}/dashboards", "*")
  metadata {
    name      = "${trimsuffix(each.value, ".json")}-ht"
    namespace = var.namespace
    labels    = { grafana_dashboard : 1 }
  }
  data = {
    "${each.value}" = "${file("${path.module}/dashboards/${each.value}")}"
  }
}
