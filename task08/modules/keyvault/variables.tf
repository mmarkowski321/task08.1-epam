variable "name" { type = string }
variable "location" { type = string }
variable "resource_group" { type = string }
variable "tenant_id" { type = string }
variable "sku" { type = string }
variable "tags" { type = map(string) }

variable "redis_hostname" { type = string }
variable "redis_primary_key" { type = string }
variable "redis_host_secret_name" { type = string }
variable "redis_key_secret_name" { type = string }
