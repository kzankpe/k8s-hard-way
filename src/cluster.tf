resource "azurerm_resource_group" "cluster" {
  name     = var.cluster_rg_name
  location = var.location

}

# Generate password for 
resource "random_password" "cluster" {
  count   = var.cluster_count
  length  = 18
  special = true
}

resource "azurerm_network_interface" "cluster" {
  count               = var.cluster_count
  name                = "${var.cluster_prefix}-nic${format("%02s", count.index + 1)}"
  resource_group_name = azurerm_resource_group.cluster.name
  location            = azurerm_resource_group.cluster.location
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.cluster.id
    private_ip_address_allocation = "Static"
  }
}

resource "azurerm_linux_virtual_machine" "cluster" {
  count                           = var.cluster_count
  name                            = "${var.cluster_prefix}${format("%02s", count.index + 1)}"
  resource_group_name             = azurerm_resource_group.cluster.name
  location                        = azurerm_resource_group.cluster.location
  network_interface_ids           = [azurerm_network_interface.cluster[count.index].id, ]
  size                            = var.cluster_size
  admin_username                  = var.admin_user_name
  admin_password                  = random_password.cluster[count.index].result
  disable_password_authentication = false
  os_disk {
    caching              = var.vm_disk_caching
    storage_account_type = var.storage_account_type
    disk_size_gb         = var.vm_disk_size
  }
  source_image_reference {
    publisher = var.vm_publisher
    offer     = var.vm_offer
    sku       = var.vm_sku
    version   = "latest"
  }

}