provider "cloudflare" {
  email   = var.email
  api_key = var.cloudflare_api_key
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
