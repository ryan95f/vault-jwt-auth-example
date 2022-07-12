resource "vault_policy" "policy" {
  name   = var.role_name
  policy = file(var.policy_file_path)
}

resource "vault_jwt_auth_backend_role" "jwt_role" {
  backend   = var.backend_path
  role_name = var.role_name
  role_type = "jwt"
  token_policies = [
    "default",
    vault_policy.policy.name
  ]

  user_claim   = var.user_claim
  bound_claims = var.bound_claims
}