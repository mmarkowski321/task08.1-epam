variable "name_prefix" {
  type        = string
  description = "Prefix for naming all resources"
}

variable "location" {
  type        = string
  description = "Azure region for deployment"
}

variable "git_pat" {
  type        = string
  description = "GitHub Personal Access Token for ACR task"
  sensitive   = true
}

variable "tags" {
  type = map(string)
  description = "Common tags to apply to all resources"
}
