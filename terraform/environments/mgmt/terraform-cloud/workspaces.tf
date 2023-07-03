resource "tfe_workspace" "terraform_cloud" {
  name              = "terraform-cloud"
  organization      = data.tfe_organization.vojtechmares.name
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "dns" {
  name              = "dns"
  organization      = data.tfe_organization.vojtechmares.name
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "vm" {
  name              = "vm"
  organization      = data.tfe_organization.vojtechmares.name
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}

resource "tfe_workspace" "backup_storage" {
  name              = "backup-storage"
  organization      = data.tfe_organization.vojtechmares.name
  execution_mode    = "local"
  terraform_version = "~>1.3.4"
}
