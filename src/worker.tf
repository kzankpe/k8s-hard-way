resource "azurerm_resource_group" "worker" {
  name     = var.worker_rg_name
  location = var.location

}

# Generate password for worker
resource "random_password" "worker" {
  count   = var.worker_count
  length  = 18
  special = true
}

resource "azurerm_availability_set" "worker" {
  name                = var.worker_availability_set
  resource_group_name = azurerm_resource_group.worker.name
  location            = azurerm_resource_group.worker.location
}

resource "azurerm_network_interface" "worker" {
  count                = var.worker_count
  name                 = "${var.worker_prefix}-nic${format("%02s", count.index + 1)}"
  resource_group_name  = azurerm_resource_group.worker.name
  location             = azurerm_resource_group.worker.location
  enable_ip_forwarding = true
  ip_configuration {
    name                          = "ipconfig"
    subnet_id                     = azurerm_subnet.worker.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "cluster" {
  count                           = var.worker_count
  name                            = "${var.worker_prefix}${format("%02s", count.index + 1)}"
  resource_group_name             = azurerm_resource_group.worker.name
  location                        = azurerm_resource_group.worker.location
  network_interface_ids           = [azurerm_network_interface.worker[count.index].id, ]
  size                            = var.worker_size
  admin_username                  = var.admin_user_name
  admin_password                  = random_password.worker[count.index].result
  disable_password_authentication = false
  availability_set_id             = azurerm_availability_set.worker.id
  os_disk {
    caching = var.vm_disk_caching
    storage_account_type = var.storage_account_type
    disk_size_gb = var.vm_disk_size
  }

  source_image_reference {
    publisher = var.vm_publisher
    offer = var.vm_offer
    sku = var.vm_sku
    version = "latest"
  }
}