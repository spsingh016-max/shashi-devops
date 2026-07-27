module "azurerm_resource_group" {
  source          = "../Child_Module/Azurerm_Resource_Group1"
  resource_groups = var.RGS

}
module "VNET" {
  depends_on       = [module.azurerm_resource_group]
  source           = "../Child_Module/Azurerm_VNET"
  Virtual_networks = var.VNET
}
module "subnet" {
  depends_on = [module.VNET]
  source     = "../Child_Module/Azurerm_Subnet"
  Subnets    = var.SBNT
}
module "PIP" {
  depends_on = [module.azurerm_resource_group]
  source     = "../Child_Module/Azurerm_PIP"
  PublicIP   = var.PIP
}
module "NIC" {
  depends_on       = [module.PIP, module.subnet]
  source           = "../Child_Module/Azurerm_NIC"
  networkinterface = var.NIC
}
module "VMS" {
  depends_on       = [module.NIC]
  source           = "../Child_Module/Azurerm_Virtal_Machine"
  VM = var.VMS
}
