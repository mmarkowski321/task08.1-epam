resource "azurerm_container_group" "aci" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = var.dns_name_label

  container {
    name   = var.name
    image  = var.image
    cpu    = var.cpu
    memory = var.memory

    ports {
      port     = 80
      protocol = "TCP"
    }

    environment_variables = {
      CREATOR        = "ACI"
      REDIS_PORT     = "6380"
      REDIS_SSL_MODE = "true"
    }

    secure_environment_variables = {
      REDIS_URL = var.redis_url
      REDIS_PWD = var.redis_pwd
    }
  }

  tags = var.tags
}
