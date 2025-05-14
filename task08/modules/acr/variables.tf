variable "name" {
  type        = string
  description = "Name of the Azure Container Registry"
}

variable "location" {
  type        = string
  description = "Azure region where the ACR will be deployed."
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group for the ACR."
}

variable "sku" {
  type        = string
  description = "SKU of the ACR"
}

variable "image_name" {
  type        = string
  description = "Name of the Docker image to build and push"
}

variable "git_pat" {
  type        = string
  sensitive   = true
  description = "Personal Access Token used to access the private GitHub repository"
}

variable "tags" {
  type        = map(string)
  description = "Map of tags to apply to the ACR"
}
