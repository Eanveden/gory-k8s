data "azuread_client_config" "current" {}

resource "azuread_application" "azuread_app" {
  display_name = "${var.resource_group_name}-sp"
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "sp" {
  application_id               = azuread_application.azuread_app.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "time_rotating" "tr" {
  rotation_days = 7
}

resource "azuread_service_principal_password" "pswd" {
  service_principal_id = azuread_service_principal.sp.object_id
  rotate_when_changed = {
    rotation = time_rotating.tr.id
  }
}