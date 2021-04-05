resource "gitlab_project" "vojtechmares_infra" {
  name         = "Infra"
  path         = "infra"
  description  = "My Infrastructure"
  namespace_id = data.gitlab_user.vojtechmares.user_id
}

resource "gitlab_project" "mc_server" {
  name         = "Server"
  path         = "server"
  description  = "Minecraft Server"
  namespace_id = gitlab_group.minecraft_server.id
}

resource "gitlab_project" "mc_discord_bot" {
  name         = "Discord Bot"
  path         = "discord-bot"
  description  = "Minecraft Server Discord Bot for automatic white-listing of new players"
  namespace_id = gitlab_group.minecraft_server.id
}
