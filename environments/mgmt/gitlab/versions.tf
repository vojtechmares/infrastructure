terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "gitlab"
    }
  }

  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "15.11.0"
    }
  }
}
