resource "aws_iam_user" "ses_panel_acaslab_user" {
  name = "panel-acaslab-emails"
}

data "aws_iam_policy_document" "ses_panel_acaslab_user" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_panel_acaslab_user_policy" {
  user   = aws_iam_user.ses_panel_acaslab_user.name
  policy = data.aws_iam_policy_document.ses_panel_acaslab_user.json
}

resource "aws_iam_access_key" "ses_panel_acaslab_user" {
  user = aws_iam_user.ses_panel_acaslab_user.name
}

output "panel_acaslab_ses_access_key" {
  value       = aws_iam_access_key.ses_panel_acaslab_user.id
  description = "Access key for SES for panel.acaslab.com"
  sensitive   = true
}

output "panel_acaslab_ses_smtp_password_v4" {
  value       = aws_iam_access_key.ses_panel_acaslab_user.ses_smtp_password_v4
  description = "SES SMTP password for SES for panel.acaslab.com"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "panel_acaslab" {
  domain = cloudflare_record.panel_acaslab_com.hostname
}

resource "aws_ses_domain_identity_verification" "panel_acaslab" {
  count      = 1
  domain     = aws_ses_domain_identity.panel_acaslab.id
  depends_on = [cloudflare_record.ses_verification_panel_acaslab_com]
}

# DKIM
resource "aws_ses_domain_dkim" "panel_acaslab" {
  domain = cloudflare_record.panel_acaslab_com.hostname
}
