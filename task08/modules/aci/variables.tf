variable "name" {
  type        = string
  description = "Container group name"
}

variable "location" {
  type        = string
  description = "Location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "dns_name_label" {
  type        = string
  description = "DNS name label"
}

variable "image" {
  type        = string
  description = "Docker image with full ACR path"
}

variable "cpu" {
  type        = number
  default     = 1
  description = "cpu"
}

variable "memory" {
  type        = number
  default     = 1.5
  description = "memory"
}

variable "redis_url" {
  type        = string
  description = "Redis host (from Key Vault)"
}

variable "redis_pwd" {
  type        = string
  description = "Redis access key (from Key Vault)"
}

variable "tags" {
  type        = map(string)
  description = "Tags"
}
