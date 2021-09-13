resource "google_identity_platform_tenant" "tenant" {
  display_name  = "tenant"
}

resource "google_identity_platform_tenant_default_supported_idp_config" "idp_config" {
  enabled       = true
  tenant        = google_identity_platform_tenant.tenant.name
  idp_id        = "playgames.google.com"
  client_id     = "my-client-id"
  client_secret = "secret"
}
