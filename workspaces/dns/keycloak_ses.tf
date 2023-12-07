resource "aws_iam_user" "ses_keycloak_user" {
  name = "keycloak-emails"
}

data "aws_iam_policy_document" "ses_keycloak_user" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_keycloak_user_policy" {
  user   = aws_iam_user.ses_keycloak_user.name
  policy = data.aws_iam_policy_document.ses_keycloak_user.json
}

resource "aws_iam_access_key" "ses_keycloak_user" {
  user = aws_iam_user.ses_keycloak_user.name
}

output "keycloak_ses_access_key" {
  value       = aws_iam_access_key.ses_keycloak_user.id
  description = "Access key for SES for Keycloak"
  sensitive   = true
}

output "keycloak_ses_smtp_password_v4" {
  value       = aws_iam_access_key.ses_keycloak_user.ses_smtp_password_v4
  description = "SES SMTP password for SES for Keycloak"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "keycloak" {
  domain = cloudflare_record.sso_mareshq_com.hostname
}

resource "aws_ses_domain_identity_verification" "keycloak" {
  count      = 1
  domain     = aws_ses_domain_identity.keycloak.id
  depends_on = [cloudflare_record.ses_verification_keycloak_mareshq_com]
}

# DKIM
resource "aws_ses_domain_dkim" "keycloak" {
  domain = cloudflare_record.sso_mareshq_com.hostname
}
