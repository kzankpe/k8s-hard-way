data "azurerm_virtual_network" "name" {
  name                = var.admin_vnet
  resource_group_name = var.admin_vnet_rg
}