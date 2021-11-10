resource "gitlab_group_membership" "tomasgrim_to_mc" {
  group_id     = gitlab_group.minecraft_server.id
  user_id      = module.tomasgrim.id
  access_level = "developer"
}
