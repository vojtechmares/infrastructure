terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.20.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.29.0"
    }
  }
}
