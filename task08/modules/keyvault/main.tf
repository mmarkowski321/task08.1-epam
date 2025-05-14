resource "azurerm_key_vault" "kv" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group
  tenant_id                  = var.tenant_id
  sku_name                   = var.sku
  purge_protection_enabled   = false
  enable_rbac_authorization  = true
  tags                       = var.tags
}

resource "azurerm_key_vault_secret" "redis_hostname" {
  name         = var.redis_host_secret_name
  value        = var.redis_hostname
  key_vault_id = azurerm_key_vault.kv.id
}

resource "azurerm_key_vault_secret" "redis_primary" {
  name         = var.redis_key_secret_name
  value        = var.redis_primary_key
  key_vault_id = azurerm_key_vault.kv.id
}
