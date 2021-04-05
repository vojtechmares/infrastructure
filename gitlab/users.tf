data "gitlab_user" "vojtechmares" {
  username = "vojtechmares"
}

module "ondrejsika" {
  source   = "./terraform-modules/user"
  name     = "Ondřej Šika"
  username = "ondrejsika"
  email    = "ondrejsika@ondrejsika.com"
}
