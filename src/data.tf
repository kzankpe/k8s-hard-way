data "azurerm_virtual_network" "admin" {
  name                = var.admin_vnet_name
  resource_group_name = var.admin_vnet_rg
}
