output "vault_name" {
  description = "Key Vault name"
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.this.vault_uri
}

output "redis_hostname" {
  description = "Name of the Redis hostname secret"
  value       = azurerm_key_vault_secret.redis_hostname.name
}

output "redis_primary_key" {
  description = "Name of the Redis primary key secret"
  value       = azurerm_key_vault_secret.redis_primary_key.name
}
