variable "rg_name" {
  type        = string
  description = "Name of Resource group"

}

variable "location" {
  description = "The location/region where the Redis Cache is created"
  type        = string
}

variable "redis_name" {
  description = "The name of the Redis Cache"
  type        = string
}

variable "capacity_redis" {
  description = "The size of the Redis Cache"
  type        = number
  default     = 2
}

variable "sku_family" {
  description = "The family of the Redis Cache"
  type        = string
  default     = "C"
}

variable "redis_sku" {
  description = "The SKU of the Redis Cache"
  type        = string
  default     = "Basic"
}

variable "tags" {
  type        = map(string)
  description = "Creator tag"

}

variable "key_vault_id" {
  description = "The ID of the Key Vault where Redis secrets will be stored"
  type        = string
}

variable "redis_hostname_secret_name" {
  description = "The name of the Key Vault Secret for Redis hostname"
  type        = string
  default     = "redis-hostname"
}

variable "redis_primary_key_secret_name" {
  description = "The name of the Key Vault Secret for Redis primary key"
  type        = string
  default     = "redis-primary-key"
}
