data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = var.tags
}

module "acr" {
  source         = "./modules/acr"
  name           = local.acr_name
  location       = var.location
  resource_group = azurerm_resource_group.rg.name
  sku            = "Standard"
  image_name     = local.docker_img_name
  git_pat        = var.git_pat
  tags           = var.tags
}

module "redis" {
  source         = "./modules/redis"
  name           = local.redis_name
  location       = var.location
  resource_group = azurerm_resource_group.rg.name
  capacity       = 2
  family         = "C"
  sku            = "Basic"
  tags           = var.tags
}

module "keyvault" {
  source                  = "./modules/keyvault"
  name                    = local.keyvault_name
  location                = var.location
  resource_group          = azurerm_resource_group.rg.name
  tenant_id               = data.azurerm_client_config.current.tenant_id
  sku                     = "standard"
  tags                    = var.tags
  redis_hostname          = module.redis.hostname
  redis_primary_key       = module.redis.primary_key
  redis_host_secret_name  = "redis-hostname"
  redis_key_secret_name   = "redis-primary-key"
}

module "aks" {
  source         = "./modules/aks"
  name           = local.aks_name
  location       = var.location
  resource_group = azurerm_resource_group.rg.name
  node_count     = 1
  node_size      = "Standard_D2ads_v5"
  tags           = var.tags
}

provider "kubectl" {
  load_config_file       = false
  host                   = module.aks.host
  client_certificate     = base64decode(module.aks.client_certificate)
  client_key             = base64decode(module.aks.client_key)
  cluster_ca_certificate = base64decode(module.aks.cluster_ca_certificate)
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id   = module.aks.id
    kv_name                     = local.keyvault_name
    redis_url_secret_name       = "redis-hostname"
    redis_password_secret_name  = "redis-primary-key"
    tenant_id                   = data.azurerm_client_config.current.tenant_id
  })
}

resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = local.docker_img_name
    image_tag        = "latest"
  })

  depends_on = [kubectl_manifest.secret_provider]
}

resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  depends_on = [kubectl_manifest.deployment]
}

data "kubernetes_service" "app_lb" {
  metadata {
    name      = "redis-flask-app-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}

module "aci" {
  source         = "./modules/aci"
  name           = local.aci_name
  dns_label      = local.aci_name
  location       = var.location
  resource_group = azurerm_resource_group.rg.name
  image          = "${module.acr.login_server}/${local.docker_img_name}:latest"
  redis_host     = module.redis.hostname
  redis_key      = module.redis.primary_key
  tags           = var.tags
}

