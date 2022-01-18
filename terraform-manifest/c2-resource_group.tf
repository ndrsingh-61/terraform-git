# Resource1: Create a resource group
resource "azurerm_resource_group" "rg" {
    name = "${var.business_division}-${var.environment}-rg"
    location = var.resource_group_location
    
}