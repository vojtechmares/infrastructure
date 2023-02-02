terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.31.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.48.0"
    }
  }
}
