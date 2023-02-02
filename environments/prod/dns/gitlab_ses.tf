resource "aws_iam_user" "ses_gitlab_user" {
  name = "gitlab-emails"
}

data "aws_iam_policy_document" "ses_gitlab_user" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_gitlab_user_policy" {
  user   = aws_iam_user.ses_gitlab_user.name
  policy = data.aws_iam_policy_document.ses_gitlab_user.json
}

resource "aws_iam_access_key" "ses_gitlab_user" {
  user = aws_iam_user.ses_gitlab_user.name
}

output "gitlab_ses_access_key" {
  value       = aws_iam_access_key.ses_gitlab_user.id
  description = "Access key for SES for GitLab"
  sensitive   = true
}

output "gitlab_ses_smtp_password_v4" {
  value       = aws_iam_access_key.ses_gitlab_user.ses_smtp_password_v4
  description = "SES SMTP password for SES for GitLab"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "gitlab" {
  domain = cloudflare_record.gitlab_mareshq_com.hostname
}

resource "aws_ses_domain_identity_verification" "gitlab" {
  count      = 1
  domain     = aws_ses_domain_identity.gitlab.id
  depends_on = [cloudflare_record.ses_verification_gitlab_mareshq_com]
}

# DKIM
resource "aws_ses_domain_dkim" "gitlab" {
  domain = cloudflare_record.gitlab_mareshq_com.hostname
}
