####################################################################
# Creates Route Table [Router] for Private Subnets (if Applicable) #
####################################################################

resource "azurerm_route_table" "private" {
  count               = length(var.subnets_private) > 0 ? 1 : 0
  location            = azurerm_resource_group.main.location
  name                = "${var.network_tags_name}-private"
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    Type = "private"
  }
}

resource "azurerm_route" "private_local_ipv4" {
  address_prefix      = local.network_cidrs[count.index]
  count               = length(var.subnets_private) > 0 ? length(local.network_cidrs) : 0
  name                = "${one(azurerm_route_table.private).name}-local-ipv4-${count.index}"
  next_hop_type       = "VnetLocal"
  resource_group_name = azurerm_resource_group.main.name
  route_table_name    = one(azurerm_route_table.private).name
}

resource "azurerm_route" "private_internet_ipv4" {
  address_prefix      = "0.0.0.0/0"
  count               = length(var.subnets_private) > 0 ? 1 : 0
  name                = "${one(azurerm_route_table.private).name}-internet-ipv4-0"
  next_hop_type       = "Internet"
  resource_group_name = azurerm_resource_group.main.name
  route_table_name    = one(azurerm_route_table.private).name
}

###################################################################
# Creates Route Table [Router] for Public Subnets (if Applicable) #
###################################################################

resource "azurerm_route_table" "public" {
  count               = length(var.subnets_private) > 0 ? 1 : 0
  location            = azurerm_resource_group.main.location
  name                = "${var.network_tags_name}-public"
  resource_group_name = azurerm_resource_group.main.name

  tags = {
    Type = "public"
  }
}

resource "azurerm_route" "public_local_ipv4" {
  address_prefix      = local.network_cidrs[count.index]
  count               = length(var.subnets_public) > 0 ? length(local.network_cidrs) : 0
  name                = "${one(azurerm_route_table.public).name}-local-ipv4-${count.index}"
  next_hop_type       = "VnetLocal"
  resource_group_name = azurerm_resource_group.main.name
  route_table_name    = one(azurerm_route_table.public).name
}

resource "azurerm_route" "public_internet_ipv4" {
  address_prefix      = "0.0.0.0/0"
  count               = length(var.subnets_public) > 0 ? 1 : 0
  name                = "${one(azurerm_route_table.public).name}-internet-ipv4-0"
  next_hop_type       = "Internet"
  resource_group_name = azurerm_resource_group.main.name
  route_table_name    = one(azurerm_route_table.public).name
}
