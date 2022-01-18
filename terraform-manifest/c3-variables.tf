#business_unit
variable "business_division" {
    description = "business division"
    type = string
    default = "HR"
}

#environment 
variable "environment" {
    description = "Environment Variable"
    type = string
    default = "dev"
}

#resource group location
variable "resource_group_location" {
    description = "Resource Group Location in azure resources to be created"
    type = string
    default = "westus"
}