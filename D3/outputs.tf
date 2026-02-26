
output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "resource_group" {
  value = azurerm_resource_group.rg.name
}

output "app_gateway_public_ip" {
  value = azurerm_public_ip.appgw_pip.ip_address
}
