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
