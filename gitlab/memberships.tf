resource "gitlab_project_membership" "ondrejsika_to_vojtechmares_infra" {
  project_id   = gitlab_project.vojtechmares_infra.id
  user_id      = module.ondrejsika.id
  access_level = "reporter"
}
