resource "gitlab_group" "mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ"
}

resource "gitlab_group" "staticahq" {
  name        = "StaticaHQ"
  path        = "staticahq"
  description = "StaticaHQ"
}

resource "gitlab_group" "mareshq_terraform_modules" {
  name        = "Terraform Modules"
  path        = "terraform-modules"
  description = "Terraform Modules"

  parent_id = gitlab_group.mareshq.id
}
