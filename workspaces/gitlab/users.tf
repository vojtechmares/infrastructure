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

module "annaliebichova" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "1.0.0"

  name     = "Anna Liebichova"
  username = "annaliebichova"
  email    = "anna.liebichova@seznam.cz"
}

module "lung" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "2.0.0"

  name     = "Lung"
  username = "lung"
  email    = "lung@skaut.cz"
}

module "michaelkaplan" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "2.0.0"

  name     = "Michael Kaplan"
  username = "michaelkaplan"
  email    = "michael@kaplan.sh"
}

module "tasartir" {
  source  = "gitlab.mareshq.com/mareshq/gitlab-user/gitlab"
  version = "2.0.0"

  name     = "Ondřej Korba"
  username = "tasartir"
  email    = "tasartir@tasartir.cz"
}
