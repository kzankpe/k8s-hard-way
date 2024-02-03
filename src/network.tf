resource "azurerm_network_security_group" "this" {
  name                = ""
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
}

resource "azurerm_virtual_network" "this" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_network_security_group.this.location
  address_space       = var.vnet_address_space

  subnet {
    name           = var.cluster_sub_name
    address_prefix = var.cluster_sub_address
    security_group = var.net_security
  }

  subnet {
    name           = var.worker_sub_name
    address_prefix = var.worker_sub_address
    security_group = var.net_security
  }
}
