resource "azurerm_network_security_group" "this" {
  name                = var.net_security
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
    security_group = azurerm_network_security_group.this.id
  }

  subnet {
    name           = var.worker_sub_name
    address_prefix = var.worker_sub_address
    security_group = azurerm_network_security_group.this.id
  }
}

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  allocation_method   = "static"
}

resource "azurerm_lb" "this" {
  name                = var.load_balancer_name
  resource_group_name = azurerm_resource_group.network.name
  location            = azurerm_resource_group.network.location
  frontend_ip_configuration {
    name                 = "PublicAddress"
    public_ip_address_id = azurerm_public_ip.this.id
  }
}