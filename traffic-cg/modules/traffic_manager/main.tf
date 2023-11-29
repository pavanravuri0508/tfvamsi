
resource "azurerm_traffic_manager_profile" "tm" {
  name                = var.profile_name
  resource_group_name = var.resource_group_name
  #location            = var.traffic_manager_location
  traffic_routing_method = "Performance" #"Priority"

  dns_config {
    relative_name = var.profile_name
    ttl           = 60
  }

  monitor_config {
    protocol   = "HTTP"
    port       = 80
    path       = "/"
    # custom_headers {
    #   name  = "Host"
    #   value = "your-webapp1.azurewebsites.net"
    # }
  }
}

  resource "azurerm_traffic_manager_azure_endpoint" "tm-endpoint-east" {
    name               = "pavan0805-webapp1"#"webapp1"
    target_resource_id = var.webapp1_resource_id
    profile_id = azurerm_traffic_manager_profile.tm.id
    # type               = "AzureEndpoints"
    priority           = 1
    weight             = 1
  }

  resource "azurerm_traffic_manager_azure_endpoint" "tm-endpoint-west" {
    name               = "pavan0805-webapp1" #"webapp2"
    target_resource_id = var.webapp2_resource_id
    profile_id = azurerm_traffic_manager_profile.tm.id
    #type               = "AzureEndpoints"
    priority           = 2
    weight             = 1
    
  }

