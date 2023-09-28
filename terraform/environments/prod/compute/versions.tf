terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.9.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.41.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

