locals {
  common_tags = {
    Creator = "milosz_markowski@epam.com"
  }

  rg_name         = "${var.prefix}-rg"
  acr_name        = replace("${var.prefix}cr", "-", "")
  aks_name        = "${var.prefix}-aks"
  keyvault_name   = "${var.prefix}-kv"
  redis_name      = "${var.prefix}-redis"
  aci_name        = "${var.prefix}-ci"
  docker_img_name = "${var.prefix}-app"
}
