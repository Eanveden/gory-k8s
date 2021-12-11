resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = local.tags
}


resource "azurerm_storage_account" "k8s_storage_account" {
  name                     = "${var.resource_group_name}stgacc"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  allow_blob_public_access = true
  account_replication_type = "LRS" #Locally Redundant storage
  tags                     = local.tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${var.resource_group_name}stgcr"
  container_access_type = "container"
  storage_account_name  = azurerm_storage_account.k8s_storage_account.name
}