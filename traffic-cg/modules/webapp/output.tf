output "app_id" {
  value = azurerm_windows_web_app.app.id
}

output "url" {
  value = azurerm_windows_web_app.app.default_hostname #azurerm_windows_web_app.app.default_site_hostname
}