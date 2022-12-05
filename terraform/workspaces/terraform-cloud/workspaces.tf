resource "tfe_workspace" "terraform_cloud" {
  name              = "terraform-cloud"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "cloudflare" {
  name              = "cloudflare"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "gitlab" {
  name              = "gitlab"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "hcloud" {
  name              = "hcloud"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "aws" {
  name              = "aws"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "do" {
  name              = "do"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}
