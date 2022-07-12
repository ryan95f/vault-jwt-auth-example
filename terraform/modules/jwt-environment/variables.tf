variable "backend_path" {
  type        = string
  description = "(Required) The backend path that will contain the role"
}

variable "bound_claims" {
  type        = map(string)
  description = "(Required) The JWT claims to bound against the backend role"
}

variable "policy_file_path" {
  type        = string
  description = "(Required) The path to the policy to access the secret"
}

variable "role_name" {
  type        = string
  description = "(Required) The name of the backend auth role"
}

variable "user_claim" {
  type        = string
  description = "(Required) the JWT claim to bind as the user"
}
