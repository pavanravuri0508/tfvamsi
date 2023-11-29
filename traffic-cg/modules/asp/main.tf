

# resource "azurerm_resource_group" "rg" {
#   name     = var.resource_group_name
#   location = var.location
# }

resource "azurerm_app_service_plan" "asp" {
  name                = "${var.app_name}-asp"
  location            = var.location#azurerm_resource_group.rg.location
  resource_group_name = var.resource_group_name#azurerm_resource_group.rg.name

  sku {
    tier = "Basic"
    size = "B1"
  }
}
