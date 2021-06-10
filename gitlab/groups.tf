resource "gitlab_group" "minecraft_server" {
  name        = "Minecraft Server"
  path        = "minercraft-server"
  description = "Minecraft Server"
}

resource "gitlab_group" "statica_cloud" {
  name        = "Statica Cloud"
  path        = "statica-cloud"
  description = "Statica Cloud"
}
