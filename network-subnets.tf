################################################################
# Creates Private Subnet(s) in Created Network (if Applicable) #
################################################################

resource "azurerm_subnet" "private" {
  address_prefixes     = [var.subnets_private[count.index].cidr]
  count                = length(var.subnets_private)
  name                 = "${var.network_tags_name}-${var.subnets_private[count.index].name}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}

resource "azurerm_subnet_network_security_group_association" "private" {
  count                     = length(var.subnets_private)
  network_security_group_id = one(azurerm_network_security_group.private).id
  subnet_id                 = azurerm_subnet.private[count.index].id
}

###############################################################
# Creates Public Subnet(s) in Created Network (if Applicable) #
###############################################################

resource "azurerm_subnet" "public" {
  address_prefixes     = [var.subnets_public[count.index].cidr]
  count                = length(var.subnets_public)
  name                 = "${var.network_tags_name}-${var.subnets_public[count.index].name}"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
}

resource "azurerm_subnet_network_security_group_association" "public" {
  count                     = length(var.subnets_public)
  network_security_group_id = one(azurerm_network_security_group.public).id
  subnet_id                 = azurerm_subnet.public[count.index].id
}
