terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "hcloud"
    }
  }

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.26.2"
    }
  }
}

