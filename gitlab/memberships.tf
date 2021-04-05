resource "gitlab_project_membership" "ondrejsika_to_vojtechmares_infra" {
  project_id   = gitlab_project.vojtechmares_infra.id
  user_id      = module.ondrejsika.id
  access_level = "reporter"
}

resource "gitlab_group_membership" "tomasgrim_to_mc" {
  group_id     = gitlab_group.minecraft_server.id
  user_id      = module.tomasgrim.id
  access_level = "developer"
}
