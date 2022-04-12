##
# MaresHQ
##

module "mareshq_infra" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Infra"
  project_path = "infra"
  project_desc = "MaresHQ Infra"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_incident_response" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Incident Response"
  project_path = "incident-response"
  project_desc = "Incident Response"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_static_sites" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Internal Static Sites"
  project_path = "internal-static-sites"
  project_desc = "Internal Static Sites"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_ansible" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Ansible"
  project_path = "ansible"
  project_desc = "Ansible playbooks"

  project_namespace_id = gitlab_group.infrastructure_mareshq.id
}

module "ci" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "CI"
  project_path = "ci"
  project_desc = "Monorepo of CI templates"

  project_namespace_id = gitlab_group.mareshq.id
}

module "tfm_gitlab_project" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "GitLab project"
  project_path = "gitlab-project"
  project_desc = "GitLab project"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_cloudflare_zone" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Cloudflare zone"
  project_path = "cloudflare-zone"
  project_desc = "Cloudflare zone"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_gitlab_user" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "GitLab user"
  project_path = "gitlab-user"
  project_desc = "GitLab user"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "mareshq_gitops" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "GitOps"
  project_path = "gitops"
  project_desc = "GitOps"

  project_namespace_id = gitlab_group.mareshq.id
}

##
# staticahq
##
module "staticahq_infra" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "Infra"
  project_path = "infra"
  project_desc = "staticahq infrastructure"

  project_namespace_id = gitlab_group.staticahq.id
}

module "staticahq_staticahq" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "staticahq monorepo"
  project_path = "staticahq"
  project_desc = "staticahq monorepo"

  project_namespace_id = gitlab_group.staticahq.id
}

##
# GitOps
##

## GitOps / SkautDevs
module "gitops_skautdevs_kissj" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "KISSJ"
  project_path = "kissj"
  project_desc = "KISSJ GitOps"

  project_namespace_id = gitlab_group.gitops_skautdevs.id
}

##
# Infrastructure
##

## Infrastructure / Terraform Modules / CI
module "infra_tfmodules_ci" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-project/gitlab"
  version = "2.0.0"

  project_name = "CI"
  project_path = "ci"
  project_desc = "CI Templates shared between modules to prevent code duplication."

  project_namespace_id = gitlab_group.infrastructure_tfmodules.id
}
