variable "name" {
  description = "Name of the Redis Cache instance"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "sku" {
  description = "SKU name (Basic, Standard, Premium)"
  type        = string
}

variable "family" {
  description = "SKU family (C or P)"
  type        = string
}

variable "capacity" {
  description = "SKU capacity (0 = smallest size)"
  type        = number
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
