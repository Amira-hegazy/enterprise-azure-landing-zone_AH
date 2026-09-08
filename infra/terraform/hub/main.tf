resource "azurerm_resource_group" "hub" {
  name     = "rg-hub-example"
  location = var.location
}
