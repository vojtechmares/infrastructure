resource "tfe_workspace" "terraform_cloud" {
  name              = "terraform-cloud"
  organization      = data.tfe_organization.vojtechmares.name
  terraform_version = "~> 1.9.0"
}

resource "tfe_workspace_settings" "terraform_cloud" {
  workspace_id   = tfe_workspace.terraform_cloud.id
  execution_mode = "local"
}

resource "tfe_workspace" "dns" {
  name              = "dns"
  organization      = data.tfe_organization.vojtechmares.name
  terraform_version = "~> 1.9.0"
}

resource "tfe_workspace_settings" "dns" {
  workspace_id   = tfe_workspace.dns.id
  execution_mode = "local"
}

resource "tfe_workspace" "vm" {
  name              = "vm"
  organization      = data.tfe_organization.vojtechmares.name
  terraform_version = "~> 1.9.0"
}

resource "tfe_workspace_settings" "vm" {
  workspace_id   = tfe_workspace.vm.id
  execution_mode = "local"
}

resource "tfe_workspace" "backup_storage" {
  name              = "backup-storage"
  organization      = data.tfe_organization.vojtechmares.name
  terraform_version = "~> 1.9.0"
}

resource "tfe_workspace_settings" "backup_storage" {
  workspace_id   = tfe_workspace.backup_storage.id
  execution_mode = "local"
}
