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

module "ci" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.0.0"

  project_name = "CI"
  project_path = "ci"
  project_desc = "Monorepo of CI templates"

  project_namespace_id = gitlab_group.mareshq.id
}

module "tfm_cloudflare_zone" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.0.0"

  project_name = "Cloudflare zone"
  project_path = "cloudflare-zone"
  project_desc = "Cloudflare zone"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}
