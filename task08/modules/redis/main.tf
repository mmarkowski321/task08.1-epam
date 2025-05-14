resource "azurerm_redis_cache" "redis" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  capacity            = var.capacity
  family              = var.family
  sku_name            = var.sku
  public_network_access_enabled = true
  minimum_tls_version = "1.2"
  tags                = var.tags
}
