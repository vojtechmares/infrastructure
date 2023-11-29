terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.9.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.27.0"
    }
  }
}
