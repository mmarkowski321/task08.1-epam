output "aci_fqdn" {
  value       = module.aci.fqdn
  description = "FQDN of the Azure Container Instance"
}

output "aks_lb_ip" {
  value       = data.kubernetes_service.app_lb.status.0.load_balancer.0.ingress.0.ip
  description = "Load Balancer IP address of the AKS-deployed app"
}
