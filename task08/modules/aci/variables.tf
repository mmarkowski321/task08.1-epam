variable "name"         { type = string }
variable "dns_label"    { type = string }
variable "location"     { type = string }
variable "resource_group" { type = string }
variable "image"        { type = string }
variable "redis_host"   { type = string }
variable "redis_key"    { type = string }
variable "tags"         { type = map(string) }
