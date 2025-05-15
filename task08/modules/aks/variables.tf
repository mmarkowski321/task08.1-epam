variable "name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "node_vm_size" {
  description = "VM size for AKS nodes"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the AKS cluster"
  type        = map(string)
}

variable "acr_id" {
  description = "ACR ID for role assignment"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default node pool"
  type        = string
  default     = "system"
}
