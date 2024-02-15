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

}

resource "azurerm_subnet" "cluster" {
  name                 = var.cluster_sub_name
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.cluster_sub_address]
}

resource "azurerm_subnet" "worker" {
  name                 = var.worker_sub_address
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [var.cluster_sub_address]
}

resource "azurerm_subnet_network_security_group_association" "cluster" {
  subnet_id                 = azurerm_subnet.cluster.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_subnet_network_security_group_association" "worker" {
  subnet_id                 = azurerm_subnet.worker.id
  network_security_group_id = azurerm_network_security_group.this.id
}

resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  allocation_method   = "Static"
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

resource "azurerm_virtual_network_peering" "a2w" {
  name                      = var.admin2workload
  resource_group_name       = var.admin_vnet_rg
  virtual_network_name      = var.admin_vnet_name
  remote_virtual_network_id = azurerm_virtual_network.this.id
}

resource "azurerm_virtual_network_peering" "w2a" {
  name                      = var.workload2admin
  resource_group_name       = azurerm_resource_group.network.name
  virtual_network_name      = azurerm_virtual_network.this.name
  remote_virtual_network_id = data.azurerm_virtual_network.admin.id
}