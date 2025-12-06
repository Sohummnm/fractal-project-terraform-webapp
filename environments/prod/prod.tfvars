# Resource Group
rg_name   = "pe1-rg-dev"
location  = "CentralCanada"

# App Service Plan
asp_sku   = "S1"

# Web App / Container
image_image_name        = "frontend:v2"      # This should match variable name
container_port          = 80

# Deployment Slots
slot_names              = ["staging", "testing"]
slot_docker_image       = "frontend:v3"
docker_registry_username = "sohummnm"

# MySQL (Classic)
mysql_server_name    = "pe1-mysql-dev"
mysql_admin_username = "mysqladmin"
mysql_admin_password = ""    # Leave empty → random password will be generated
mysql_database_name  = "pe1db"
