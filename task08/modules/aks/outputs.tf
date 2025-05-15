output "kubelet_identity" {
  description = "The kubelet identity block with client_id and object_id"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity
}

output "kube_config_raw" {
  description = "Raw kube config for kubectl provider"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}