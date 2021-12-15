variable "k8s_host" {
  description = "The hostname (in form of URI) of the Kubernetes API."
  type        = string
}

variable "k8s_client_certificate" {
  description = "PEM-encoded client certificate for TLS authentication."
  type        = string
}

variable "k8s_client_key" {
  description = "PEM-encoded client certificate key for TLS authentication."
  type        = string
}

variable "k8s_cluster_ca_certificate" {
  description = "PEM-encoded root certificates bundle for TLS authentication."
  type        = string
}

variable "name" {
  description = "The name of the prometheus_operator"
  type        = string
  default     = "prometheus_operator"
}

variable "namespace" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = string
  default     = "monitoring"
}

variable "create_namespace" {
  description = "Create the namespace if it does not yet exists."
  type        = bool
  default     = true
}

variable "value" {
  description = "Values for the prometheus_operator chart."
  default     = ""
}