variable "name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "location" {
  type        = string
  description = "Location for the ACR"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name where ACR will be deployed"
}

variable "sku" {
  type        = string
  description = "SKU for ACR"
}

variable "git_repo_url" {
  type        = string
  description = "GitHub repo URL"
}

variable "git_repo_branch" {
  type        = string
  default     = "main"
  description = "Branch name"
}

variable "git_pat" {
  type        = string
  description = "GitHub PAT"
  sensitive   = true
}

variable "image_repo_name" {
  type        = string
  description = "Docker image name"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}