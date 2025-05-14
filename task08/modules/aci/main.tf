resource "azurerm_container_group" "aci" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_label

  container {
    name   = var.name
    image  = var.image
    cpu    = "1"
    memory = "1.5"

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      CREATOR         = "ACI"
      REDIS_PORT      = "6380"
      REDIS_SSL_MODE  = "True"
    }

    secure_environment_variables = {
      REDIS_HOST = var.redis_host
      REDIS_KEY  = var.redis_key
    }
  }

  tags = var.tags
}
