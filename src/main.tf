resource "azurerm_resource_group" "network" {
  name     = var.vnet_rg_name
  location = var.location
}