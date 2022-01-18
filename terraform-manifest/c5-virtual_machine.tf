#Create a virtual machine
resource "azurerm_linux_virtual_machine" "linux-vm" {
    name = "${var.business_division}-${var.environment}-linuxvm"
    computer_name = "${var.environment}-linuxvm"
    resource_group_name = azurerm_resource_group.rg.name
    location = var.resource_group_location
    network_interface_ids = [azurerm_network_interface.vm_nic.id]
    size = "Standard_DS1_v2"
    admin_username = "azureuser"
    admin_ssh_key {
        username = "azureuser"
        public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    }
    os_disk {
        name = "osdisk"
        caching = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }
    source_image_reference {
        publisher = "RedHat"
        offer     = "RHEL"
        sku       = "83-gen2"
        version   = "latest"
    }
}