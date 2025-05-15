output "kubelet_identity" {
  description = "The kubelet identity block with client_id and object_id"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity
}
