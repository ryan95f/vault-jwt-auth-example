resource "vault_jwt_auth_backend" "jwt_backend" {
  description = "Demonstration of the Terraform JWT auth backend"
  path        = "jwt"
  jwt_validation_pubkeys = [
    file("../keys/jwtRS256.key.pub")
  ]
}

module "production" {
  source = "./modules/jwt-environment"

  role_name        = "production"
  user_claim       = "branch"
  backend_path     = vault_jwt_auth_backend.jwt_backend.path
  policy_file_path = "./policies/production.hcl"
  bound_claims = {
    branch = "prod"
  }
}
