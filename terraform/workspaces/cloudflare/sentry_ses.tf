resource "aws_iam_user" "ses_sentry_user" {
  name = "sentry-emails"
}

data "aws_iam_policy_document" "ses_sentry_user" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_sentry_user_policy" {
  user   = aws_iam_user.ses_sentry_user.name
  policy = data.aws_iam_policy_document.ses_sentry_user.json
}

resource "aws_iam_access_key" "ses_sentry_user" {
  user = aws_iam_user.ses_sentry_user.name
}

output "sentry_ses_access_key" {
  value       = aws_iam_access_key.ses_sentry_user.id
  description = "Access key for SES for Sentry"
  sensitive   = true
}

output "sentry_ses_smtp_password_v4" {
  value       = aws_iam_access_key.ses_sentry_user.ses_smtp_password_v4
  description = "SES SMTP password for SES for Sentry"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "sentry" {
  domain = cloudflare_record.sentry_mareshq_com.hostname
}

resource "aws_ses_domain_identity_verification" "sentry" {
  domain     = aws_ses_domain_identity.sentry.id
  depends_on = [cloudflare_record.ses_verification_sentry_mareshq_com]
}

# DKIM
resource "aws_ses_domain_dkim" "sentry" {
  domain = cloudflare_record.sentry_mareshq_com.hostname
}
