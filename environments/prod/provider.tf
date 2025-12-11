terraform {
  required_version = ">=1.6.0, < 2.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "db_terraform_rg"
    storage_account_name  = "fractalappservice"
    container_name        = "prod"
    key                   = "prod.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "39ee914d-94f1-4df9-83a4-72718520cb1a"
  features {}
}
