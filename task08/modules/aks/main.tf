resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  dns_prefix          = var.name

  default_node_pool {
    name           = "system"
    node_count     = var.node_count
    vm_size        = var.node_size
    os_disk_type = "Managed"
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = false
  }

  tags = var.tags
}
