

variable "resource_group_name" {
    type = string
}
variable "location" {
    type = string
}
variable "app_name" {
    type = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
}