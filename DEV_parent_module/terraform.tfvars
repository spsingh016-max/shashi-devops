RGS = {
  RG1 = {
    name     = "dev_rg"
    location = "central india"
  }
}

VNET = {
  VNET1 = {
    name                = "dev_vnet"
    location            = "central india"
    resource_group_name = "dev_rg"
    address_space       = ["10.0.0.0/16"]
  }
}
SBNT = {
  SBNT1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "dev_rg"
    virtual_network_name = "dev_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  SBNT2 = {
    name                 = "backend-subnet"
    resource_group_name  = "dev_rg"
    virtual_network_name = "dev_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
PIP = {
  PIP1 = {
    name                = "frontend_pip"
    resource_group_name = "dev_rg"
    location            = "central india"
    allocation_method   = "Static"
  }
  PIP2 = {
    name                = "backend_pip"
    resource_group_name = "dev_rg"
    location            = "central india"
    allocation_method   = "Static"
  }
}

NIC = {
  NIC1 = {
    nic-name                 = "frontend_nic"
    nic-location             = "central india"
    nic-resource_group_name  = "dev_rg"
    nic-subnet_id            = "frontend-subnet"
    nic-public_ip_address    = "frontend_pip"
    nic-virtual_network_name = "dev_vnet"

  }
  NIC2 = {
    nic-name                 = "backend_nic"
    nic-location             = "central india"
    nic-resource_group_name  = "dev_rg"
    nic-subnet_id            = "backend-subnet"
    nic-public_ip_address    = "backend_pip"
    nic-virtual_network_name = "dev_vnet"

  }
}
VMS = {
  VM1 = {
    name                  = "frontend_vm"
    location              = "central india"
    resource_group_name   = "dev_rg"
    network_interface_ids = "frontend_nic"
    vm_size               = "Standard_D2s_v3"
      computer_name  = "frontendVM"
      disk-name              = "myosdisk1"
  }
   VM2 = {
    name                  = "backend_vm"
    location              = "central india"
    resource_group_name   = "dev_rg"
    network_interface_ids = "backend_nic"
    vm_size               = "Standard_D2s_v3"
    computer_name  = "backendVM"
    disk-name              = "myosdisk2"
  }
}
