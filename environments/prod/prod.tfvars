# Resource Group
rg_name   = "pe1-rg-dev"
location  = "East US"

# App Service Plan
asp_sku   = "B1"

# Web App / Container
frontend_image = "myacr.azurecr.io/myfrontend"
container_port = 80

# Deployment Slots
slot_names       = ["staging", "testing"]
acr_login_server = "myacr.azurecr.io"
image_name       = "myfrontend"

# MySQL
mysql_server_name   = "pe1-mysql-dev"
mysql_admin_username = "mysqladmin"
mysql_admin_password = ""   # Leave empty to auto-generate
mysql_database_name  = "pe1db"
