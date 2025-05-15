output "kubelet_identity" {
  description = "The kubelet identity block with client_id and object_id"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity
}

output "kube_config_raw" {
  description = "Raw kube config for kubectl provider"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.aks.kube_config.0.host
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate
  sensitive = true
}
