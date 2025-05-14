variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "sku" {
  type = string
}

variable "image_name" {
  type = string
}

variable "git_pat" {
  type      = string
  sensitive = true
}

variable "tags" {
  type = map(string)
}
