resource "gitlab_project" "vojtechmares_infra" {
  name         = "Infra"
  path         = "infra"
  description  = "My Infrastructure"
  namespace_id = data.gitlab_user.vojtechmares.user_id
}
