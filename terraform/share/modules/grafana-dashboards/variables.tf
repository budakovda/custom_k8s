variable "name" {
  description = "The name of the prometheus_operator"
  type        = string
  default     = "grafana-dashboards"
}

variable "namespace" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = string
  default     = "monitoring"
}

variable "boards" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = string
}

variable "labels" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = map
  default     = {}

}
