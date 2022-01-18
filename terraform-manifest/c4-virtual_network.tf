#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
    name = "${var.business_division}-${var.environment}-vnet"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.resource_group_location
    address_space = ["10.0.0.0/16"]
}
#Create Subnet
resource "azurerm_subnet" "subnet" {
    name = "${var.business_division}-${var.environment}-subnet"
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = ["10.0.2.0/24"]
}

#Create Public IP Address
resource "azurerm_public_ip" "public_ip" {
    name = "${var.business_division}-${var.environment}-publicip"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.resource_group_location
    allocation_method = "Static"
}

#Create Network Interface
resource "azurerm_network_interface" "vm_nic" {
    name = "${var.business_division}-${var.environment}-vmnic"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.resource_group_location
    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.public_ip.id
    }
}
