variable "address" {
  type        = string
  description = "(Required) The address of the Vault server"
}

variable "environments" {
  type = map(object({
    user_claim   = string
    bound_claims = map(string)
    policy_path  = string
  }))
  default     = {}
  description = "(Optional) The JWT backend roles for an environment"
}

variable "secrets_path" {
  type        = string
  default     = "secrets"
  description = "(Optional) The secrets mount path"
}

variable "secrets" {
  type    = map(map(string))
  default = {}

  description = "(Optional) Secrets to be stored in secrets mount"
}

variable "secrets_description" {
  type        = string
  default     = "Secret Engine for managing environment secrets"
  description = "(Optional) The description for the secrets mount"
}

