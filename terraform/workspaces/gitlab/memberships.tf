resource "gitlab_group_membership" "ondrejsika_to_mareshq" {
  group_id     = gitlab_group.mareshq.id
  user_id      = module.ondrejsika.id
  access_level = "developer"
}

resource "gitlab_group_membership" "annaliebichova_to_mareshq" {
  group_id     = gitlab_group.mareshq.id
  user_id      = module.annaliebichova.id
  access_level = "developer"
}

resource "gitlab_group_membership" "tomasgrim_to_mareshq" {
  group_id     = gitlab_group.mareshq.id
  user_id      = module.tomasgrim.id
  access_level = "developer"
}

resource "gitlab_group_membership" "lung_to_gitops_skautdevs" {
  group_id     = gitlab_group.gitops_skautdevs.id
  user_id      = module.lung.id
  access_level = "developer"
}

resource "gitlab_group_membership" "michaelkapan_to_gitops_skautdevs" {
  group_id     = gitlab_group.gitops_skautdevs.id
  user_id      = module.michaelkaplan.id
  access_level = "developer"
}
