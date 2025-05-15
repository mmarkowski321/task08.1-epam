resource "azurerm_container_registry" "acr" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  admin_enabled       = false
  tags                = var.tags
}

resource "azurerm_container_registry_task" "build" {
  name                  = "build-task"
  container_registry_id = azurerm_container_registry.acr.id

  platform {
    os           = "Linux"
    architecture = "amd64"
  }

  docker_step {
    dockerfile_path      = "application/Dockerfile"
    context_path         = var.git_repo_url
    context_access_token = var.git_pat
    image_names = [
      "${azurerm_container_registry.acr.login_server}/${var.image_repo_name}:latest"
    ]
    push_enabled  = true
    cache_enabled = true
  }

  source_trigger {
    name           = "github-trigger"
    source_type    = "Github"
    repository_url = var.git_repo_url
    branch         = var.git_repo_branch
    events         = ["commit"]

    authentication {
      token         = var.git_pat
      token_type    = "PAT"
      scope         = "repo"
      refresh_token = null
    }
  }

  tags = var.tags
}

resource "azurerm_container_registry_task_schedule_run_now" "schedule_run" {
  container_registry_task_id = azurerm_container_registry_task.build.id
}
