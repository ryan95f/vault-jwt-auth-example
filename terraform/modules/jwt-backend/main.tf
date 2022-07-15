resource "vault_jwt_auth_backend" "jwt_backend" {
  description = var.description
  path        = var.path
  jwt_validation_pubkeys = [
    file(var.public_key_path)
  ]
}