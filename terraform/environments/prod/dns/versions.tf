terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "3.35.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}
