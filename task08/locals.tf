locals {
  rg_name         = "${var.name_prefix}-rg"
  acr_name        = replace("${var.name_prefix}cr", "-", "")
  aks_name        = "${var.name_prefix}-aks"
  keyvault_name   = "${var.name_prefix}-kv"
  redis_name      = "${var.name_prefix}-redis"
  aci_name        = "${var.name_prefix}-ci"
  docker_img_name = "${var.name_prefix}-app"
}
