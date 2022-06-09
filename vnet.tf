# VNETs

resource "azurerm_virtual_network" "vnetcentossbd" {
  name                = "vnetcentossbd"
  resource_group_name = azurerm_resource_group.azurepoc.name
  location            = azurerm_resource_group.azurepoc.location
  address_space       = ["192.168.0.0/16"]

  tags = {
    org          = "demo-org"
  }

  depends_on = [azurerm_resource_group.azurepoc]
}

resource "azurerm_subnet" "centossbdsn1" {
  name                 = "centossbdsn1"
  resource_group_name  = azurerm_resource_group.azurepoc.name
  address_prefixes     = ["192.168.77.0/25"]
  virtual_network_name = azurerm_virtual_network.vnetcentossbd.name
}

resource "azurerm_network_interface_security_group_association" "sgcentossbdnic" {
  network_interface_id      = azurerm_network_interface.centossbdnic1.id
  network_security_group_id = azurerm_network_security_group.centossbdnsg1.id
}

# NAT GATEWAY

# resource "azurerm_nat_gateway" "centossbd-gw1" {
#  name                = "centossbd-gw1"
#  location            = azurerm_resource_group.azurepoc.location
#  resource_group_name = azurerm_resource_group.azurepoc.name
#  tags = {
#    org = "demo-org"
#  }
#}
