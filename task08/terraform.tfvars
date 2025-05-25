name_prefix  = "cmtr-6bbc5609-mod8-rg"
location     = "East US"
git_repo_url = "https://github.com/mmarkowski321/task08.1-epam"
git_branch   = "master"


capacity_redis     = 2
sku_family         = "C"
redis_sku          = "Basic"
sku_kv             = "standard"
acr_sku            = "Basic"
aci_sku            = "Standard"
aks_node_pool_name = "system"
aks_node_count     = 1
aks_vm_size        = "Standard_D2ads_v5"
aks_os_disk_type   = "Ephemeral"
tags = {
  Creator = "milosz_markowski@epam.com"
}
