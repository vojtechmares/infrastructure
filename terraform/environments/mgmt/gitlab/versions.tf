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
      version = "16.1.0"
    }
  }
}
