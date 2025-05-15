
output "kube_config_raw" {
  description = "Raw kube config for kubectl provider"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

