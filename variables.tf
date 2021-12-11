#Optional
variable "agent_count" {
  default = 3
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
  default = "k8s"
}

variable "cluster_name" {
  default = "k8s"
}

variable "resource_group_name" {
  default = "rg-group"
}

variable "location" {
  default = "East US"
}

variable "creator" {
  default = "erik"
}

variable "environment" {
  default = "Development"
}

variable "k8s_service_cidr" {
  default = "10.0.1.0/24"
}

variable "docker_bridge_cidr" {
  default = "10.0.2.0/16"
}

variable "k8s_dns_service_ip" {
  default = "10.0.1.10"
}

variable "vnet_address_space" {
  default = ["10.0.0.0/16"]
}

variable "k8s_subnet_address_prefixes" {
  default = ["10.0.0.0/24"]
}

variable "subscription_id" {}
variable "tenant_id" {}
