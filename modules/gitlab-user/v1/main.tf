resource "gitlab_user" "user" {
  name           = var.name
  username       = var.username
  email          = var.email
  reset_password = true
}
