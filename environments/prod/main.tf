
module "rg" {
  source   = "../../modules/resourcegroup"
  name     = "pe1-rg-dev"
  location = "Central Canada"
}

module "app_service_plan" {
  source              = "../../modules/appserviceplan"
  name                = "pe1-asp-dev"
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku_name            = "S1"  # adjust as needed
}


module "appservice" {
  source                = "../../modules/appservice"
  name                  = "pe1-webapp-dev"
  location              = module.rg.location
  resource_group_name   = module.rg.name
  app_service_plan_id   = module.app_service_plan.id
  docker_registry_username = var.docker_registry_username
  docker_image          = var.image_name
  container_port        = 80

  # MySQL connection
  mysql_host            = var.mysql_host
  mysql_username        = var.mysql_username
  mysql_password        = var.mysql_password
  mysql_database        = var.mysql_database_name

  additional_app_settings = {
    "ENV" = "dev"
  }
}

module "webapp_slots" {
  source              = "../../modules/deploymentslots"
  app_service_id      = module.appservice
  app_service_plan_id = module.app_service_plan.id
  app_service_name = module.appservice.default_hostname
  slot_names          = ["staging", "testing"]
  location = module.rg.location
  resource_group_name = module.rg.name
  docker_image = var.slot_docker_image

  acr_login_server    = "fractaltrainingterraform-g9csa7hef9gkhwau.azurecr.io"
  image_name          = "myfrontend"
  container_port      = 80

  mysql_host            = var.mysql_host
  mysql_username        = var.mysql_username
  mysql_password        = var.mysql_password
  mysql_database        = var.mysql_database_name

  additional_app_settings = {
    "ENV" = "prod"
  }
}
