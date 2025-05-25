variable "rg_name" {
  type        = string
  description = "Name of Resource group"

}

variable "location" {
  description = "The location/region where the Key Vault is created"
  type        = string
}

variable "keyvault_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "sku_kv" {
  description = "The SKU of the Key Vault"
  type        = string
  default     = "standard"
}

variable "tags" {
  type        = map(string)
  description = "Creator tag"

}

variable "tenant_id" {
  description = "The Azure Active Directory tenant ID to use for authenticating requests to Key Vault"
  type        = string
}

variable "current_user_object_id" {
  description = "The object ID of the current user or service principal"
  type        = string
}
