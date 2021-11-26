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

resource "gitlab_project" "mareshq_incident_response" {
  name           = "Incident Response"
  path           = "incident-response"
  description    = "Incident Response"
  namespace_id   = gitlab_group.mareshq.id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "mareshq_incident_response" {
  project            = gitlab_project.mareshq_incident_response.id
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_project" "mareshq_static_sites" {
  name           = "Static Sites"
  path           = "static-sites"
  description    = "Static Sites"
  namespace_id   = gitlab_group.mareshq.id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "mareshq_static_sites" {
  project            = gitlab_project.mareshq_static_sites.id
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_project" "mareshq_ansible" {
  name           = "Ansible"
  path           = "ansible"
  description    = "Ansible playbooks"
  namespace_id   = gitlab_group.mareshq.id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "mareshq_ansible" {
  project            = gitlab_project.mareshq_ansible.id
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_project" "tfm_gitlab_project" {
  name           = "GitLab project"
  path           = "gitlab-project"
  description    = "GitLab project"
  namespace_id   = gitlab_group.mareshq_terraform_modules.id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "tfm_gitlab_project" {
  project            = gitlab_project.tfm_gitlab_project.id
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}
