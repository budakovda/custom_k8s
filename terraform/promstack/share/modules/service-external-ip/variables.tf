variable "name" {
  description = "Values for service-external-ip chart."
  default     = ""
}

variable "namespace" {
  description = "Values for service-external-ip chart."
  default     = "monitoring"
}

variable "create_namespace" {
  description = "Create the namespace if it does not yet exists."
  type        = bool
  default     = true
}

variable "value" {
  description = "Values for service-external-ip chart."
  default     = ""
}
