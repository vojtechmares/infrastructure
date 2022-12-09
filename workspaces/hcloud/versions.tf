terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "hcloud"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.29.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.36.1"
    }
  }
}

