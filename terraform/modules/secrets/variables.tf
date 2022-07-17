variable "description" {
  type        = string
  description = "(Required) The description of the secret mount"
}

variable "path" {
  type        = string
  description = "(Required) The path to the secret mount"
}

variable "secrets" {
  type        = map(map(string))
  default     = {}
  description = "(Optional) The secrets to be stored in the mount"
}