resource "vault_mount" "secret_mount" {
  path = var.path
  type = "kv"
  options = {
    version = "2"
  }
  description = var.description
}

resource "vault_kv_secret_v2" "secret" {
  mount    = vault_mount.secret_mount.path
  for_each = var.secrets

  name      = each.key
  data_json = jsonencode(each.value)
}