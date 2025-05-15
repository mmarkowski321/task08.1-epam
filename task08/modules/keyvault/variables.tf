variable "name" {
  description = "Name of the Azure Key Vault"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where Key Vault is deployed"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
}

variable "redis_host" {
  description = "Redis hostname to store as secret"
  type        = string
}

variable "redis_key" {
  description = "Redis access key to store as secret"
  type        = string
}

variable "aks_kubelet_identity" {
  description = "AKS kubelet managed identity object ID"
  type        = string
}
