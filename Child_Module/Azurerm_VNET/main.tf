variable "Virtual_networks" {}
resource "azurerm_virtual_network" "VNET" {
    for_each = var.Virtual_networks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
}