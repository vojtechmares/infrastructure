resource "tfe_workspace" "terraform_cloud" {
  name              = "terraform-cloud"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "dns" {
  name              = "dns"
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

resource "tfe_workspace" "vm" {
  name              = "vm"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "backup_storage" {
  name              = "backup-storage"
  organization      = tfe_organization.vojtechmares.id
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}
