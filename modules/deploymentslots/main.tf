resource "azurerm_linux_web_app_slot" "this" {
  for_each          = toset(var.slot_names)
  app_service_id     = var.app_service_id
  name               = each.value
  service_plan_id    = var.app_service_plan_id
  https_only         = true

  site_config {
    always_on = true

    application_stack {
      docker_image_name = var.docker_image
    }
  }

  app_settings = merge(
    {
      "WEBSITES_PORT"  = var.container_port
      "MYSQL_HOST"     = var.mysql_host
      "MYSQL_USERNAME" = var.mysql_username
      "MYSQL_PASSWORD" = var.mysql_password
      "MYSQL_DATABASE" = var.mysql_database
    },
    var.additional_app_settings
  )

  identity {
    type = "SystemAssigned"
  }
}
