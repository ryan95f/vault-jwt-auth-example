variable "address" {
  type    = string
  default = "localhost:8200"
}

variable "environments" {
  type = map(object({
    user_claim   = string
    bound_claims = map(string)
    policy_path  = string
  }))
  default = {}
}