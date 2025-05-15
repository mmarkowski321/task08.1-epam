output "aci_fqdn" {
  description = "FQDN of the ACI app"
  value       = module.aci.fqdn
}

output "aks_lb_ip" {
  description = "Public IP address of AKS LoadBalancer service"
  value       = data.kubernetes_service.flask_service.status[0].load_balancer[0].ingress[0].ip
}
