resource "gitlab_group" "mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ"
}

resource "gitlab_group" "staticahq" {
  name        = "staticahq"
  path        = "staticahq"
  description = "staticahq"
}

resource "gitlab_group" "mareshq_terraform_modules" {
  name        = "Terraform Modules"
  path        = "terraform-modules"
  description = "Terraform Modules"

  parent_id = gitlab_group.mareshq.id
}

resource "gitlab_group" "infrastructure" {
  name        = "Infrastructure"
  path        = "infrastructure"
  description = "Infrastructure"
}

resource "gitlab_group" "infrastructure_tfmodules" {
  name        = "Terraform Modules"
  path        = "terraform-modules"
  description = "Terraform Modules"

  parent_id = gitlab_group.infrastructure.id
}

resource "gitlab_group" "infrastructure_mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ Infrastructure"

  parent_id = gitlab_group.infrastructure.id
}

resource "gitlab_group" "infrastructure_staticahq" {
  name        = "StaticaHQ"
  path        = "staticahq"
  description = "StaticaHQ Infrastructure"

  parent_id = gitlab_group.infrastructure.id
}

resource "gitlab_group" "gitops" {
  name        = "GitOps"
  path        = "gitops"
  description = "GitOps"
}

resource "gitlab_group" "gitops_mareshq" {
  name        = "MaresHQ"
  path        = "mareshq"
  description = "MaresHQ GitOps"

  parent_id = gitlab_group.gitops.id
}

resource "gitlab_group" "gitops_skautdevs" {
  name        = "SkautDevs"
  path        = "skautdevs"
  description = "SkautDevs GitOps"

  parent_id = gitlab_group.gitops.id
}

resource "gitlab_group" "wsj" {
  name        = "WSJ"
  path        = "wsj"
  description = "WSJ"
}
