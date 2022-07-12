resource "vault_mount" "super_secrets" {
  path        = "secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "Hello world from Terraform"
}

resource "vault_kv_secret_v2" "production" {
  mount = vault_mount.super_secrets.path
  name  = "production"
  data_json = jsonencode({
    message = "My Production Secret"
  })
}

resource "vault_kv_secret_v2" "development" {
  mount = vault_mount.super_secrets.path
  name  = "development"
  data_json = jsonencode({
    message       = "My Development Secret"
  })
}