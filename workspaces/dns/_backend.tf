terraform {
  backend "s3" {
    bucket = "terraform-state"
    key    = "dns/terraform.tfstate"
    region = "auto"

    endpoints = {
      s3 = "https://f24333bb3c47d6db753e57e2a0c90082.r2.cloudflarestorage.com"
    }

    use_lockfile = true # R2-native state locking (Terraform 1.10+), no DynamoDB

    # Cloudflare R2 is not AWS - disable AWS-specific behaviors
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
}
