data "gitlab_user" "vojtechmares" {
  username = "vojtechmares"
}

module "ondrejsika" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "1.0.0"

  name     = "Ondřej Šika"
  username = "ondrejsika"
  email    = "ondrejsika@ondrejsika.com"
}

module "tomasgrim" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "1.0.0"

  name     = "Tomáš Grim"
  username = "tomasgrim"
  email    = "grimi@volny.cz"
}
