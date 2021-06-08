resource "tfe_organization" "vojtechmares" {
  name  = "vojtechmares"
  email = "iam@vojtechmares.com"
}

resource "tfe_organization_membership" "ondrejsika2vojtechmares" {
  organization = tfe_organization.vojtechmares.id
  email        = "ondrej@ondrejsika.com"
}
