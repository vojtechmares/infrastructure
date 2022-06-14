resource "tfe_workspace" "terraform_cloud" {
  name              = "terraform-cloud"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.2.2"
}

resource "tfe_workspace" "cloudflare" {
  name              = "cloudflare"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.2.2"
}

resource "tfe_workspace" "gitlab" {
  name              = "gitlab"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.2.2"
}

resource "tfe_workspace" "hcloud" {
  name              = "hcloud"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.2.2"
}

resource "tfe_workspace" "aws" {
  name              = "aws"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.1.8"
}

resource "tfe_workspace" "do" {
  name              = "do"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "remote"
  terraform_version = "1.2.2"
}
