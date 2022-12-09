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
      version = "3.20.0"
    }
  }
}
