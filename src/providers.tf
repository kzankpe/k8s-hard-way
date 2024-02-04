terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.90.0"
    }
  }
  backend "azurerm" {

  }
}

provider "azurerm" {
  features {}
  use_msi = true
}