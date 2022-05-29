resource "azurerm_kubernetes_cluster" "k8s" {
  depends_on = [
    azurerm_resource_group.erik_k8s
  ]

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  tags                = local.tags

  default_node_pool {
    name                = "agentpool"
    node_count          = var.agent_count
    vm_size             = "Standard_D2_v2"
    os_disk_size_gb     = 30
    enable_auto_scaling = true
    max_count           = 80
    min_count           = 1
  }

  linux_profile {
    admin_username = "eanveden"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  service_principal {
    client_id     = azuread_service_principal.sp.application_id
    client_secret = azuread_service_principal_password.pswd.value
  }

  network_profile {
    load_balancer_sku  = "standard"
    network_plugin     = "azure"
    network_policy     = "azure"
    service_cidr       = var.k8s_service_cidr
    docker_bridge_cidr = var.docker_bridge_cidr
    dns_service_ip     = var.k8s_dns_service_ip
  }
}

resource "azurerm_resource_group" "erik_k8s" {
  name     = var.resource_group_name
  location = var.location
}