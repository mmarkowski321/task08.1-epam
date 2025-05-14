variable "name" { type = string }
variable "location" { type = string }
variable "resource_group" { type = string }
variable "node_count" { type = number }
variable "node_size" { type = string }
variable "tags" { type = map(string) }
