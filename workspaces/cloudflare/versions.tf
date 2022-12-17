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
      version = "3.30.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.46.0"
    }
  }
}
