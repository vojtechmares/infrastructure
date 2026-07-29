provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

# The AWS provider is only needed for the mail.mareshq.com SES setup.
#
# The root .envrc exports the Cloudflare R2 state-backend keys as
# AWS_ACCESS_KEY_ID / AWS_SECRET_ACCESS_KEY. The provider picks those up when it
# validates credentials against STS, which fails with InvalidClientTokenId and
# blocks every plan and apply here, including Cloudflare-only changes. Skipping
# validation lets the explicit access_key/secret_key below serve the real API
# calls. The backend block skips the same checks for the same reason.
#
# Do not add skip_requesting_account_id: it empties account_id in the
# aws_iam_access_key identity and fails the plan with an identity mismatch.
provider "aws" {
  region     = "eu-central-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  skip_credentials_validation = true
  skip_metadata_api_check     = true
}
