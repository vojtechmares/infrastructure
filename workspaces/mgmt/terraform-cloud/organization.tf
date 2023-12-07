data "tfe_organization" "vojtechmares" {
  name = "vojtechmares"
}

resource "tfe_organization_membership" "ondrejsika2vojtechmares" {
  organization = data.tfe_organization.vojtechmares.name
  email        = "ondrej@ondrejsika.com"
}
