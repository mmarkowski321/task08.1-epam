variable "prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "git_repo_url" {
  description = "GitHub repository URL"
  type        = string
}

variable "git_repo_branch" {
  description = "GitHub repo branch"
  type        = string
  default     = "main"
}

variable "git_pat" {
  description = "GitHub PAT"
  type        = string
  sensitive   = true
}

variable "image_repo_name" {
  description = "Name for Docker image"
  type        = string
}

variable "acr_sku" {
  type    = string
  default = "Standard"
}

variable "redis_sku" {
  type    = string
  default = "Basic"
}

variable "redis_family" {
  type    = string
  default = "C"
}

variable "redis_capacity" {
  type    = number
  default = 2
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_vm_size" {
  type    = string
  default = "Standard_D2ads_v5"
}

variable "tags" {
  description = "Common tags for resources"
  type        = map(string)
}
