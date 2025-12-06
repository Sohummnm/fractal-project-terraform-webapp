resource "azurerm_linux_web_app_slot" "this" {
  for_each          = toset(var.slot_names)
  app_service_id     = var.app_service_id
  name               = each.value
  https_only         = true

  site_config {
    application_stack {
      docker_image_name = "${var.docker_image_slot}:${var.docker_image_tag_slot}"
      docker_registry_url      = "https://index.docker.io"   # optional for Docker Hub
      docker_registry_username = var.docker_registry_username      # only if private
      docker_registry_password = var.docker_registry_password     # only if private
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
