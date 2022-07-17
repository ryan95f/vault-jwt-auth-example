variable "description" {
  type        = string
  description = "(Required) The JWT auth backend description"
}

variable "public_key_path" {
  type        = string
  sensitive   = true
  description = "(Required) The path to the public key to validate JWT tokens"
}

variable "path" {
  type        = string
  default     = "jwt"
  description = "(Optional) The JWT backend path"
}