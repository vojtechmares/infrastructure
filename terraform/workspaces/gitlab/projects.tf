module "mareshq_infra" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "Infra"
  project_path = "infra"
  project_desc = "MaresHQ Infra"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_incident_response" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "Incident Response"
  project_path = "incident-response"
  project_desc = "Incident Response"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_static_sites" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "Static Sites"
  project_path = "static-sites"
  project_desc = "Static Sites"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_ansible" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "Ansible"
  project_path = "ansible"
  project_desc = "Ansible playbooks"

  project_namespace_id = gitlab_group.mareshq.id
}

module "ci" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "CI"
  project_path = "ci"
  project_desc = "Monorepo of CI templates"

  project_namespace_id = gitlab_group.mareshq.id
}

module "tfm_gitlab_project" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "GitLab project"
  project_path = "gitlab-project"
  project_desc = "GitLab project"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_cloudflare_zone" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "Cloudflare zone"
  project_path = "cloudflare-zone"
  project_desc = "Cloudflare zone"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_gitlab_user" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "1.1.0"

  project_name = "GitLab user"
  project_path = "gitlab-user"
  project_desc = "GitLab user"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}
