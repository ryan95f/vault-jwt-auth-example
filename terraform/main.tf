module "jwt_backend" {
  source = "./modules/jwt-backend"

  description     = "Demonstration of the Terraform JWT auth backend"
  public_key_path = "../keys/jwtRS256.key.pub"
}

module "environments" {
  source   = "./modules/jwt-environment"
  for_each = var.environments

  role_name        = each.key
  user_claim       = each.value.user_claim
  backend_path     = module.jwt_backend.path
  policy_file_path = each.value.policy_path
  bound_claims     = each.value.bound_claims
}
