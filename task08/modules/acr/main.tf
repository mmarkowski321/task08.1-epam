resource "azurerm_container_registry" "acr" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  sku                 = var.sku
  admin_enabled       = true
  tags                = var.tags
}
