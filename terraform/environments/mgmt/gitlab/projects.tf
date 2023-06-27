##
# MaresHQ
##

module "mareshq_infra" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Infra"
  project_path = "infra"
  project_desc = "MaresHQ Infra"

  project_namespace_id = gitlab_group.infrastructure_mareshq.id
}

module "mareshq_incident_response" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Incident Response"
  project_path = "incident-response"
  project_desc = "Incident Response"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_static_sites" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Internal Static Sites"
  project_path = "internal-static-sites"
  project_desc = "Internal Static Sites"

  project_namespace_id = gitlab_group.mareshq.id
}

module "mareshq_ansible" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Ansible"
  project_path = "ansible"
  project_desc = "Ansible playbooks"

  project_namespace_id = gitlab_group.infrastructure_mareshq.id
}

module "mareshq_k3s_ansible" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "k3s Ansible"
  project_path = "k3s-ansible"
  project_desc = "k3s Ansible. Upstream: https://github.com/k3s-io/k3s-ansible"

  project_namespace_id = gitlab_group.infrastructure_mareshq.id
}

module "ci" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "CI"
  project_path = "ci"
  project_desc = "Monorepo of CI templates"

  project_namespace_id = gitlab_group.mareshq.id
}

module "ci_toolkit" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "CI Toolkit"
  project_path = "ci-toolkit"
  project_desc = "CI Toolkit: a docker image with all the things"

  project_namespace_id = gitlab_group.mareshq.id
}

module "training_hub" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Training Hub"
  project_path = "training-hub"
  project_desc = "Training Hub"

  project_namespace_id = gitlab_group.mareshq.id
}

module "tfm_gitlab_project" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "GitLab project"
  project_path = "gitlab-project"
  project_desc = "GitLab project"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_cloudflare_zone" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Cloudflare zone"
  project_path = "cloudflare-zone"
  project_desc = "Cloudflare zone"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "tfm_gitlab_user" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "GitLab user"
  project_path = "gitlab-user"
  project_desc = "GitLab user"

  project_namespace_id = gitlab_group.mareshq_terraform_modules.id
}

module "mareshq_gitops" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Ant"
  project_path = "ant"
  project_desc = "Ant Kubernetes Cluster manifests for GitOps"

  project_namespace_id = gitlab_group.gitops_mareshq.id
}

module "gitops_mareshq_fox" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Fox"
  project_path = "fox"
  project_desc = "Fox Kubernetes Cluster manifests for GitOps"

  project_namespace_id = gitlab_group.gitops_mareshq.id
}

module "gitops_mareshq_bee" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Bee"
  project_path = "bee"
  project_desc = "Bee Kubernetes Cluster manifests for GitOps"

  project_namespace_id = gitlab_group.gitops_mareshq.id
}

##
# GitOps
##

## GitOps / SkautDevs
module "gitops_skautdevs_kissj" {
  source = "./../../modules/gitlab-project/v1"

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
  source = "./../../modules/gitlab-project/v1"

  project_name = "CI"
  project_path = "ci"
  project_desc = "CI Templates shared between modules to prevent code duplication."

  project_namespace_id = gitlab_group.infrastructure_tfmodules.id
}

module "wsj_standup_discord_notification" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Standup Discord Notification"
  project_path = "standup-discord-notification"
  project_desc = "Standup Discord Notification via Discord Webhooks"

  project_namespace_id = gitlab_group.wsj.id
}

##
# Stepanka
##

module "stepanka_website" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Website"
  project_path = "website"
  project_desc = "Website: https://www.stepanka.net"

  project_namespace_id = gitlab_group.stepanka.id
}

module "renovate_runner" {
  source = "./../../modules/gitlab-project/v1"

  project_name = "Renovate Runner"
  project_path = "renovate-runner"
  project_desc = "Docs: https://docs.renovatebot.com"

  project_namespace_id = gitlab_group.renovate.id
}
