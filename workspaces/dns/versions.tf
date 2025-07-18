terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "< 6.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "< 7.0.0"
    }
  }
}
