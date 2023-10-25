#########################################################################
# Creates Network Security Group [Network Firewall] for Private Subnets #
#########################################################################

resource "azurerm_network_security_group" "private" {
  count               = length(var.subnets_private) > 0 ? 1 : 0
  location            = azurerm_resource_group.main.location
  name                = "${var.network_tags_name}-private"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "private_egress_ipv4" {
  access                      = "Allow"
  description                 = "Allows All Egress Traffic via IPv4"
  destination_address_prefix  = "0.0.0.0/0"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "${var.network_tags_name}-private-egress-ipv4"
  network_security_group_name = one(azurerm_network_security_group.private).name
  priority                    = 600
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.main.name
  source_address_prefixes     = azurerm_virtual_network.main.address_space
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "private_ingress_ipv4" {
  access                       = "Allow"
  description                  = "Allows Ingress Traffic via IPv4"
  destination_address_prefixes = azurerm_virtual_network.main.address_space
  destination_port_range       = "*"
  direction                    = "Inbound"
  name                         = "${var.network_tags_name}-private-ingress-ipv4"
  network_security_group_name  = one(azurerm_network_security_group.private).name
  priority                     = 500
  protocol                     = "*"
  resource_group_name          = azurerm_resource_group.main.name
  source_address_prefixes      = azurerm_virtual_network.main.address_space
  source_port_range            = "*"
}

########################################################################
# Creates Network Security Group [Network Firewall] for Public Subnets #
########################################################################

resource "azurerm_network_security_group" "public" {
  count               = length(var.subnets_public) > 0 ? 1 : 0
  location            = azurerm_resource_group.main.location
  name                = "${var.network_tags_name}-public"
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_network_security_rule" "public_egress_ipv4" {
  access                      = "Allow"
  description                 = "Allows All Egress Traffic via IPv4"
  destination_address_prefix  = "0.0.0.0/0"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "${var.network_tags_name}-public-egress-ipv4"
  network_security_group_name = one(azurerm_network_security_group.public).name
  priority                    = 600
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.main.name
  source_address_prefixes     = azurerm_virtual_network.main.address_space
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "public_egress_ipv6" {
  access                      = "Allow"
  count                       = var.network_enable_ipv6 ? 1 : 0
  description                 = "Allows All Egress Traffic via IPv6"
  destination_address_prefix  = "::/0"
  destination_port_range      = "*"
  direction                   = "Outbound"
  name                        = "${var.network_tags_name}-public-egress-ipv6"
  network_security_group_name = one(azurerm_network_security_group.public).name
  priority                    = 650
  protocol                    = "*"
  resource_group_name         = azurerm_resource_group.main.name
  source_address_prefix       = "::/0"
  source_port_range           = "*"
}

resource "azurerm_network_security_rule" "public_ingress_ipv4" {
  access                       = "Allow"
  description                  = "Allows Ingress Traffic via IPv4"
  destination_address_prefixes = azurerm_virtual_network.main.address_space
  destination_port_range       = "*"
  direction                    = "Inbound"
  name                         = "${var.network_tags_name}-public-ingress-ipv4"
  network_security_group_name  = one(azurerm_network_security_group.public).name
  priority                     = 500
  protocol                     = "*"
  resource_group_name          = azurerm_resource_group.main.name
  source_address_prefix        = "0.0.0.0/0"
  source_port_range            = "*"
}
