data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "acr" {
  source              = "./modules/acr"
  name                = local.acr_name
  resource_group_name = local.rg_name
  location            = var.location
  sku                 = var.acr_sku
  git_repo_url        = var.git_repo_url
  git_repo_branch     = var.git_repo_branch
  git_pat             = var.git_pat
  image_repo_name     = var.image_repo_name
  tags                = var.tags
}

module "redis" {
  source              = "./modules/redis"
  name                = local.redis_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.redis_sku
  family              = var.redis_family
  capacity            = var.redis_capacity
  tags                = local.common_tags
}


module "keyvault" {
  source               = "./modules/keyvault"
  name                 = local.keyvault_name
  location             = var.location
  resource_group_name  = azurerm_resource_group.rg.name
  redis_host           = module.redis.hostname
  redis_key            = module.redis.primary_key
  aks_kubelet_identity = module.aks.kubelet_identity[0].object_id
  tags                 = local.common_tags
}

module "aks" {
  source              = "./modules/aks"
  name                = local.aks_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  node_count          = var.node_count
  node_vm_size        = var.node_vm_size
  dns_prefix          = var.prefix
  node_pool_name      = "system"
  tags                = local.common_tags
  acr_id              = module.acr.acr_id
}


provider "kubectl" {
  host                   = module.aks.kube_config.host
  client_certificate     = base64decode(module.aks.kube_config.client_certificate)
  client_key             = base64decode(module.aks.kube_config.client_key)
  cluster_ca_certificate = base64decode(module.aks.kube_config.cluster_ca_certificate)
  load_config_file       = false
}

resource "kubectl_manifest" "secret_provider" {
  yaml_body = templatefile("${path.module}/k8s-manifests/secret-provider.yaml.tftpl", {
    aks_kv_access_identity_id  = module.aks.kubelet_identity[0].client_id
    kv_name                    = module.keyvault.vault_name
    redis_url_secret_name      = "redis-hostname"
    redis_password_secret_name = "redis-primary-key"
    tenant_id                  = data.azurerm_client_config.current.tenant_id
  })

  wait_for {
    field {
      key   = "status.conditions[0].type"
      value = "Ready"
    }
  }
}


resource "kubectl_manifest" "deployment" {
  yaml_body = templatefile("${path.module}/k8s-manifests/deployment.yaml.tftpl", {
    acr_login_server = module.acr.login_server
    app_image_name   = var.image_repo_name
    image_tag        = "latest"
    redis_host_key   = "redis-hostname"
    redis_pwd_key    = "redis-primary-key"
  })

  wait_for {
    field {
      key   = "status.availableReplicas"
      value = "1"
    }
  }

  depends_on = [kubectl_manifest.secret_provider]
}


resource "kubectl_manifest" "service" {
  yaml_body = file("${path.module}/k8s-manifests/service.yaml")

  wait_for {
    field {
      key        = "status.loadBalancer.ingress[0].ip"
      value      = "^(\\d+(\\.|$)){4}"
      value_type = "regex"
    }
  }

  depends_on = [kubectl_manifest.deployment]
}



data "kubernetes_service" "flask_service" {
  metadata {
    name      = "flask-service"
    namespace = "default"
  }

  depends_on = [kubectl_manifest.service]
}

module "aci" {
  source              = "./modules/aci"
  name                = local.aci_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_name_label      = local.aci_name
  image               = "${module.acr.login_server}/${var.image_repo_name}:latest"
  cpu                 = 1
  memory              = 1.5
  redis_url           = module.keyvault.redis_hostname
  redis_pwd           = module.keyvault.redis_primary_key
  tags                = local.common_tags
}
