resource "azurerm_resource_group" "terraformtest" {
  name= "${var.rg}"
  location="${var.location}"
  tags="${var.tags}"
}

resource "azurerm_virtual_network" "datanetwork" {
  name                 = "datanetwork"
  resource_group_name = "${var.rg}"
  address_space = ["10.0.0.0/16"]
  location="${var.location}"
    
  tags ="${var.tags}"
}

resource "azurerm_virtual_network" "apinetwork" {
  name = "apinetwork"
  resource_group_name = "${var.rg}"
  address_space = ["10.10.0.0/16"]
  location="${var.location}"
    
  tags ="${var.tags}"
}

resource "azurerm_virtual_network_peering" "ApiToData" {
    name="ApiToData"
    resource_group_name = "${var.rg}"
    virtual_network_name="apinetwork"
    remote_virtual_network_id="/subscriptions/1ec45680-2837-43d6-833b-f2ee3a45b659/resourceGroups/terraform-testgroup/providers/Microsoft.Network/virtualNetworks/datanetwork"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
resource "azurerm_virtual_network_peering" "DataToApi" {
    name="DataToApi"
    resource_group_name = "${var.rg}"
    virtual_network_name="datanetwork"
    remote_virtual_network_id="/subscriptions/1ec45680-2837-43d6-833b-f2ee3a45b659/resourceGroups/terraform-testgroup/providers/Microsoft.Network/virtualNetworks/apinetwork"
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
}
