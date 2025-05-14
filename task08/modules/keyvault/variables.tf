variable "name" {
  type        = string
  description = "Name of the Key Vault instance."
}

variable "location" {
  type        = string
  description = "Azure region where the Key Vault will be deployed."
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group for the Key Vault."
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID used for RBAC access to the Key Vault."
}

variable "sku" {
  type        = string
  description = "SKU for the Key Vault"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to the Key Vault"
}

variable "redis_hostname" {
  type        = string
  description = "Hostname of the Redis instance to store in Key Vault"
}

variable "redis_primary_key" {
  type        = string
  description = "Primary access key for Redis to store in Key Vault"
}

variable "redis_host_secret_name" {
  type        = string
  description = "Name of the secret in Key Vault for the Redis hostname"
}

variable "redis_key_secret_name" {
  type        = string
  description = "Name of the secret in Key Vault for the Redis primary key."
}
