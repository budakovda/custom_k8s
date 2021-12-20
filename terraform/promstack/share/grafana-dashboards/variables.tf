variable "namespace" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = string
  default     = "monitoring"
}
