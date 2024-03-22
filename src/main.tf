resource "azurerm_resource_group" "network" {
  name     = var.vnet_rg_name
  location = var.location
}

# Generate the certificat using the script

resource "null_resource" "this" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/generate-cert.sh"
  }
}