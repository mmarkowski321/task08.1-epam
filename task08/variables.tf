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
  description = "GitHub repository branch to build from"
  type        = string
  default     = "main"
}

variable "git_pat" {
  description = "GitHub Personal Access Token (PAT) for accessing the repository"
  type        = string
  sensitive   = true
}

variable "image_repo_name" {
  description = "Name of the Docker image repository in ACR"
  type        = string
}

variable "acr_sku" {
  description = "SKU (pricing tier) of the Azure Container Registry"
  type        = string
  default     = "Standard"
}

variable "redis_sku" {
  description = "SKU of the Azure Redis Cache instance"
  type        = string
  default     = "Basic"
}

variable "redis_family" {
  description = "Family of the Azure Redis Cache instance (e.g., C)"
  type        = string
  default     = "C"
}

variable "redis_capacity" {
  description = "Capacity of the Azure Redis Cache instance (e.g., 0, 1, 2...)"
  type        = number
  default     = 2
}

variable "node_count" {
  description = "Number of nodes in the default node pool for AKS"
  type        = number
  default     = 1
}

variable "node_vm_size" {
  description = "Size of virtual machines for AKS nodes"
  type        = string
  default     = "Standard_D2ads_v5"
}

variable "tags" {
  description = "Common tags to apply to all Azure resources"
  type        = map(string)
}
