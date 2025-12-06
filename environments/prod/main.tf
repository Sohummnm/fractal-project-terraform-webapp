
module "rg" {
  source   = "../../modules/resourcegroup"
  name     = "pe1-rg-dev"
  location = "East US"
}

module "app_service_plan" {
  source              = "../../modules/appserviceplan"
  name                = "pe1-asp-dev"
  location            = module.rg.location
  resource_group_name = module.rg.name
  sku_name            = "B1"  # adjust as needed
}

module "mysql" {
  source               = "../../modules/azuremysql"
  server_name          = "pe1-mysql-dev"
  resource_group_name  = module.rg.name
  location             = module.rg.location
  sku_name             = "B_Gen5_1"
  admin_username       = "mysqladmin"
  admin_password       = ""  # will be auto-generated
  database_name        = "pe1db"
  public_access_enabled = false
}


module "webapp" {
  source                = "../../modules/appservice"
  name                  = "pe1-webapp-dev"
  location              = module.rg.location
  resource_group_name   = module.rg.name
  app_service_plan_id   = module.app_service_plan.id
  docker_registry_username = var.docker_registry_username
  docker_image          = var.image_name
  container_port        = 80

  # MySQL connection
  mysql_host            = module.mysql.host
  mysql_username        = module.mysql.username
  mysql_password        = module.mysql.password
  mysql_database        = module.mysql.database_name

  additional_app_settings = {
    "ENV" = "dev"
  }
}

module "webapp_slots" {
  source              = "../../modules/deploymentslot"
  app_service_id      = module.webapp.id
  app_service_plan_id = module.app_service_plan.id
  slot_names          = ["staging", "testing"]

  acr_login_server    = "myacr.azurecr.io"
  image_name          = "myfrontend"
  container_port      = 80

  mysql_host          = module.mysql.host
  mysql_username      = module.mysql.username
  mysql_password      = module.mysql.password
  mysql_database      = module.mysql.database_name

  additional_app_settings = {
    "ENV" = "dev"
  }
}
