variable "name" { type = string }
variable "location" { type = string }
variable "resource_group" { type = string }
variable "capacity" { type = number }
variable "family" { type = string }
variable "sku" { type = string }
variable "tags" { type = map(string) }
