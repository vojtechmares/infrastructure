terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "core"
    }
  }

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.7.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.26.0"
    }
  }
}

