terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "vm"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.51.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.49.1"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

provider "hcloud" {
  token = var.hcloud_token
}

variable "cloudflare_api_token" {
  type      = string
  sensitive = true
}

variable "hcloud_token" {
  type      = string
  sensitive = true
}
