variable "name" {
  type        = string
  description = "Name of the Azure Container Instance"
}

variable "dns_label" {
  type        = string
  description = "DNS name label for the ACI"
}

variable "location" {
  type        = string
  description = "Azure region where the ACI will be deployed."
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group for the ACI."
}

variable "image" {
  type        = string
  description = "Container image name to run in the ACI"
}

variable "redis_host" {
  type        = string
  description = "Redis host address to be passed as an environment variable."
}

variable "redis_key" {
  type        = string
  description = "Redis access key to be passed as a secure environment variable."
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to the ACI."
}
