variable "networkinterface" {}

data "azurerm_subnet" "example" {
    for_each = var.networkinterface
  name                 = each.value.nic-subnet_id
  virtual_network_name = each.value.nic-virtual_network_name
  resource_group_name  = each.value.nic-resource_group_name
}
data "azurerm_public_ip" "PIP" {
    for_each = var.networkinterface
  name                = each.value.nic-public_ip_address
  resource_group_name = each.value.nic-resource_group_name
}
resource "azurerm_network_interface" "example" {
    for_each = var.networkinterface
  name                = each.value.nic-name
  location            = each.value.nic-location
  resource_group_name = each.value.nic-resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address = data.azurerm_public_ip.PIP[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}