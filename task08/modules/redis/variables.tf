variable "name" {
  type        = string
  description = "Name of the Redis instance"
}

variable "location" {
  type        = string
  description = "Azure region where the Redis instance will be deployed"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group for the Redis instance"
}

variable "capacity" {
  type        = number
  description = "Cache size of the Redis instance "
}

variable "family" {
  type        = string
  description = "The SKU family to use "
}

variable "sku" {
  type        = string
  description = "SKU name of the Redis cache "
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to the Redis instance"
}
