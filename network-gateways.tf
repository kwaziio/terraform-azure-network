#####################################################################
# Creates Network Address Translation (NAT) Gateway (if Applicable) #
#####################################################################

resource "azurerm_public_ip" "nat_gateway" {
  allocation_method   = "Static"
  count               = length(var.subnets_private) > 0 && var.network_enable_nat ? 1 : 0
  name                = "${azurerm_virtual_network.main.name}-nat-gateway"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "main" {
  count               = length(var.subnets_private) > 0 && var.network_enable_nat ? 1 : 0
  name                = azurerm_virtual_network.main.name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku_name            = "Standard"
}

resource "azurerm_nat_gateway_public_ip_association" "main" {
  count                = length(var.subnets_private) > 0 && var.network_enable_nat ? 1 : 0
  nat_gateway_id       = one(azurerm_nat_gateway.main).id
  public_ip_address_id = one(azurerm_public_ip.nat_gateway).id
}
