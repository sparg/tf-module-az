# Create a virtual network
resource "azurerm_virtual_network" "tf-vm-tg" {
  name                = "${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-vnet-${var.instance}"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Create a subnet
resource "azurerm_subnet" "tf-vm-tg" {
  name                 = "${var.resource_group_name}-${var.environment}-${lower(replace(var.location, " ", ""))}-snet-${var.instance}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.tf-vm-tg.name
  address_prefixes     = [var.subnet_address_prefix]
}
