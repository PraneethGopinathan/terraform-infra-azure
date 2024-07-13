resource "azurerm_public_ip" "public_ip" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}"
  resource_group_name = var.resource_grp_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = var.env
  }
}

resource "azurerm_network_interface" "nic" {
  count               = var.vm_count
  name                = "${var.vm_name}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_grp_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip[count.index].id
  }

  tags = {
    Environment = var.env
  }
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "nsg" {
  name                = "${random_pet.prefix.id}-nsg"
  location            = var.location
  resource_group_name = var.resource_grp_name

  security_rule {
    name                       = "SSH"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTPS"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Connect the security group to the network interface
# Connect the security group to each network interface
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  count                     = var.vm_count
  network_interface_id      = azurerm_network_interface.nic[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}