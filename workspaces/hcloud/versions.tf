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
      version = "3.4.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.26.2"
    }
  }
}
