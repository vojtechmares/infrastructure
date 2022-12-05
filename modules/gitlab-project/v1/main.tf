resource "gitlab_project" "project" {
  name                   = var.project_name
  path                   = var.project_path
  description            = var.project_desc
  namespace_id           = var.project_namespace_id
  default_branch         = var.project_default_branch
  shared_runners_enabled = var.shared_runners_enabled
}

resource "gitlab_branch_protection" "default_branch_protection" {
  project            = gitlab_project.project.id
  branch             = var.project_default_branch
  push_access_level  = var.protection_push_access_level
  merge_access_level = var.protection_merge_access_level
}
