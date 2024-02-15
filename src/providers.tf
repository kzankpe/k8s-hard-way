terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.90.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "=3.6.0"
    }
  }

  backend "azurerm" {

  }
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
  use_msi = true
}