locals {
  name_prefix       = var.name_prefix
  rg_name           = format("%s-rg", local.name_prefix)
  aci_name          = format("%s-ci", local.name_prefix)
  acr_name          = format("%scr", replace(local.name_prefix, "-", ""))
  aks_name          = format("%s-aks", local.name_prefix)
  keyvault_name     = format("%s-kv", local.name_prefix)
  redis_name        = format("%s-redis", local.name_prefix)
  docker_image_name = "${local.name_prefix}-app"
  docker_image_tag  = "latest"
}
