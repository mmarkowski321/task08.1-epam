variable "name" {
  type        = string
  description = "Name of the AKS cluster."
}

variable "location" {
  type        = string
  description = "Azure region where the AKS cluster will be deployed"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group for the AKS cluster"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
}

variable "node_size" {
  type        = string
  description = "VM size for the AKS node pool"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to the AKS cluster."
}
