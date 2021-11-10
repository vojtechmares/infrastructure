locals {
  default_branch = "main"
}

resource "gitlab_project" "vojtechmares_infra" {
  name           = "Infra"
  path           = "infra"
  description    = "My Infrastructure"
  namespace_id   = data.gitlab_user.vojtechmares.user_id
  default_branch = local.default_branch
}

resource "gitlab_branch_protection" "vojtechmares_infra_main" {
  project            = "34"
  branch             = local.default_branch
  push_access_level  = "maintainer"
  merge_access_level = "maintainer"
}

resource "gitlab_project" "mc_server" {
  name           = "Server"
  path           = "server"
  description    = "Minecraft Server"
  namespace_id   = gitlab_group.minecraft_server.id
  default_branch = local.default_branch
}

resource "gitlab_project" "mc_discord_bot" {
  name           = "Discord Bot"
  path           = "discord-bot"
  description    = "Minecraft Server Discord Bot for automatic white-listing of new players"
  namespace_id   = gitlab_group.minecraft_server.id
  default_branch = local.default_branch
}

resource "gitlab_project" "statica_cloud_monorepo" {
  name           = "Monorepo"
  path           = "monorepo"
  description    = "Statica cloud monorepo"
  namespace_id   = gitlab_group.statica_cloud.id
  default_branch = local.default_branch
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
