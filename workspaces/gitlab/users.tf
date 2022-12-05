data "gitlab_user" "vojtechmares" {
  username = "vojtechmares"
}

module "ondrejsika" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Ondřej Šika"
  username = "ondrejsika"
  email    = "ondrejsika@ondrejsika.com"
}

module "tomasgrim" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Tomáš Grim"
  username = "tomasgrim"
  email    = "grimi@volny.cz"
}

module "annaliebichova" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Anna Liebichova"
  username = "annaliebichova"
  email    = "anna.liebichova@seznam.cz"
}

module "lung" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Lung"
  username = "lung"
  email    = "lung@skaut.cz"
}

module "michaelkaplan" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Michael Kaplan"
  username = "michaelkaplan"
  email    = "michael@kaplan.sh"
}

module "tasartir" {
  source = "./../../modules/gitlab-user/v1"

  name     = "Ondřej Korba"
  username = "tasartir"
  email    = "tasartir@tasartir.cz"
}
