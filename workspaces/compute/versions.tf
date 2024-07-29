terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.38.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.47.0"
    }
  }
}

