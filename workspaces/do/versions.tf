terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.25.2"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.16.0"
    }
  }
}
