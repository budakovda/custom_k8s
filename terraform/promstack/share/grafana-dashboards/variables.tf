variable "name" {
  description = "The name in which the prometheus_operator chart will be deployed."
  type        = string
  default     = "promstack"
}

variable "namespace" {
  description = "The namespace in which the prometheus_operator chart will be deployed."
  type        = string
  default     = "monitoring"
}
