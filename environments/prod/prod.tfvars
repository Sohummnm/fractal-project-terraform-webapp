# Resource Group
rg_name   = "pe1-rg-dev"
location  = "CentralCanada"

# App Service Plan
asp_sku   = "S1"

# Web App / Container
image_image_name = "frontend:v2"
container_port = 80

# Deployment Slots
slot_names       = ["staging", "testing"]
#acr_login_server = "myacr.azurecr.io"
slot_docker_image       = "frontend:v3"
docker_registry_username = "sohummnm"

# MySQL
mysql_server_name   = "pe1-mysql-dev"
mysql_admin_username = "mysqladmin"
mysql_admin_password = ""   # Leave empty to auto-generate
mysql_database_name  = "pe1db"
