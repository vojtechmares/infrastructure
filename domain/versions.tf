terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "domain"
    }
  }

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "2.19.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "3.35.0"
    }
  }
}
