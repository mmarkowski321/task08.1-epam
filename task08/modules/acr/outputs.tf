output "acr_id" {
  description = "The ID of the ACR"
  value       = azurerm_container_registry.acr.id
}

output "login_server" {
  description = "The login server URL of ACR"
  value       = azurerm_container_registry.acr.login_server
}
