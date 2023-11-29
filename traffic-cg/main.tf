
module "resource_group_webapp1" {
  source  = "./modules/rg"
  name    = var.resource_group_name_webapp1
  location = var.location_webapp1
}

module "resource_group_webapp2" {
  source  = "./modules/rg"
  name    = var.resource_group_name_webapp2
  location = var.location_webapp2
}

module "resource_group_traffic_manager" {
  source  = "./modules/rg"
  name    = var.resource_group_name_traffic_manager
  location = var.traffic_manager_location
}

module "appservice_plan_webapp1" {
  source   = "./modules/asp"
  resource_group_name = var.resource_group_name_webapp1
  #name    = var.resource_group_name_webapp1
  location = module.resource_group_webapp1.location
  #name     = "webapp1-asp"
  app_name           = "pavan0805-webapp1-asp"
}

module "appservice_plan_webapp2" {
  source   = "./modules/asp"
  resource_group_name = var.resource_group_name_webapp2
  location = module.resource_group_webapp2.location
  app_name           = "pavan0805-webapp2-asp"
  #name     = "webapp2-asp"
}

module "webapp1" {
  source = "./modules/webapp"
  
  resource_group_name = var.resource_group_name_webapp1
  location           = var.location_webapp1
  app_name           = "pavan0805-webapp1"
  app_service_plan_id = module.appservice_plan_webapp1.id
}

module "webapp2" {
  source = "./modules/webapp"
  
  resource_group_name = var.resource_group_name_webapp2
  location           = var.location_webapp2
  app_name           = "pavan0805-webapp2"
  app_service_plan_id = module.appservice_plan_webapp2.id
}

module "traffic_manager" {
  source = "./modules/traffic_manager"
  depends_on = [ module.resource_group_webapp1,module.resource_group_webapp2,module.resource_group_traffic_manager ]
  resource_group_name        = var.resource_group_name_traffic_manager  # Use webapp1's resource group
  profile_name               = var.profile_name
  traffic_manager_location   = var.traffic_manager_location
  webapp1_resource_id    = module.webapp1.app_id
  webapp2_resource_id    = module.webapp2.app_id
}