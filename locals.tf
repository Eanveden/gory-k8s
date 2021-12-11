locals {
  # Tags for ALL resources
  tags = {
    "location"    = var.location
    "creator"     = var.creator
    "environment" = var.environment
  }
}