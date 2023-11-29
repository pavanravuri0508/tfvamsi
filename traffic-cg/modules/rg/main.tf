resource "azurerm_resource_group" "rg" {
  name     = var.name
  location = var.location
}

output "location" {
  value = azurerm_resource_group.rg.location
}