variable "name" {
  type        = string
  description = "Example: John Doe"
}

variable "username" {
  type        = string
  description = "Example: johndoe_"
}

variable "email" {
  type = string
}

output "id" {
  value = gitlab_user.user.id
}

resource "gitlab_user" "user" {
  name           = var.name
  username       = var.username
  email          = var.email
  reset_password = true
}
