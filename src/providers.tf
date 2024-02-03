terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_msi      = true
  msi_endpoint = var.msi_endpoint
}