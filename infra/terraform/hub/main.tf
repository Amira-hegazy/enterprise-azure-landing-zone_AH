resource "azurerm_resource_group" "hub" {
  name     = "rg-hub-example"
  location = var.location
}

resource "azurerm_virtual_network" "hub" {
  name                = "vnet-hub-example"
  resource_group_name = azurerm_resource_group.hub.name
  location            = azurerm_resource_group.hub.location
  address_space       = ["10.20.0.0/20"]
}
