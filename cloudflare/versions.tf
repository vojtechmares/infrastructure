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
      version = "2.21.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.44.0"
    }
  }
}
