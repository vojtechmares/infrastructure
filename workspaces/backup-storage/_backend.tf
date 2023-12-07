terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "backup-storage"
    }
  }
}
