resource "tfe_workspace" "terraform_cloud" {
  name         = "terraform-cloud"
  organization = tfe_organization.vojtechmares.id
  execution_mode = "remote"
}

resource "tfe_workspace" "core" {
  name         = "core"
  organization = tfe_organization.vojtechmares.id
  execution_mode = "remote"
}

resource "tfe_workspace" "domain" {
  name         = "domain"
  organization = tfe_organization.vojtechmares.id
  execution_mode = "remote"
}

resource "tfe_workspace" "gitlab" {
  name         = "gitlab"
  organization = tfe_organization.vojtechmares.id
  execution_mode = "remote"
}
