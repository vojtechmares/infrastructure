variable "zone" {
  type = string
}

variable "always_use_https" {
  type    = string
  default = "on"
}

variable "automatic_https_rewrites" {
  type    = string
  default = "on"
}

variable "ssl" {
  type    = string
  default = "full"
}
