
output "traffic_manager_url" {
  value = azurerm_traffic_manager_profile.tm.fqdn
}