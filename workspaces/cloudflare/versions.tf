terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "cloudflare"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.4.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.75.2"
    }
  }
}
