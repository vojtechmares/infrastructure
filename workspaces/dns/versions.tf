terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">=4.32.0,<5.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.49.0, < 6.0.0"
    }
  }
}
