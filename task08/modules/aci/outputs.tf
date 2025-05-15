output "fqdn" {
  description = "ACI DNS FQDN"
  value       = azurerm_container_group.aci.fqdn
}
