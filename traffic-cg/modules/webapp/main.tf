resource "azurerm_windows_web_app" "app" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id = var.app_service_plan_id

  site_config {
    always_on        = true
    app_command_line = ""
  }
}
