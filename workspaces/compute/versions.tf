terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.39.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.48.0"
    }
  }
}

