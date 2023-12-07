terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "terraform-cloud"
    }
  }
}
