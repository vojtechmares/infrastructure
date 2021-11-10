locals {
  default_branch = "main"
}

resource "gitlab_project" "mareshq_infra" {
  name           = "Infra"
  path           = "infra"
  description    = "MaresHQ Infra"
  namespace_id   = gitlab_group.mareshq.id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "mareshq_infra" {
  project            = gitlab_project.mareshq_infra.id
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}
