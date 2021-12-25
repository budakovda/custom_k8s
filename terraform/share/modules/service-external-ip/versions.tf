terraform {
  required_version = ">= 1.0.1"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.2.0"
    }
  }
}
