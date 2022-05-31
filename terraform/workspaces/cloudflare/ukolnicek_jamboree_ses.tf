resource "aws_iam_user" "ses_ukolnicek_jamboree_user" {
  name = "ukolnicek-jamboree-emails"
}

data "aws_iam_policy_document" "ses_ukolnicek_jamboree_user" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_ukolnicek_jamboree_user_policy" {
  user   = aws_iam_user.ses_ukolnicek_jamboree_user.name
  policy = data.aws_iam_policy_document.ses_ukolnicek_jamboree_user.json
}

resource "aws_iam_access_key" "ses_ukolnicek_jamboree_user" {
  user = aws_iam_user.ses_ukolnicek_jamboree_user.name
}

output "ukolnicek_jamboree_ses_access_key" {
  value       = aws_iam_access_key.ses_ukolnicek_jamboree_user.id
  description = "Access key for SES for ukolnicek_jamboree"
  sensitive   = true
}

output "ukolnicek_jamboree_ses_smtp_password_v4" {
  value       = aws_iam_access_key.ses_ukolnicek_jamboree_user.ses_smtp_password_v4
  description = "SES SMTP password for SES for ukolnicek_jamboree"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "ukolnicek_jamboree" {
  domain = cloudflare_record.ukolnicek_makejted_cz.hostname
}

resource "aws_ses_domain_identity_verification" "ukolnicek_jamboree" {
  domain     = aws_ses_domain_identity.ukolnicek_jamboree.id
  depends_on = [cloudflare_record.ses_verification_ukolnicek_makejted_cz]
}

# DKIM
resource "aws_ses_domain_dkim" "ukolnicek_jamboree" {
  domain = cloudflare_record.ukolnicek_makejted_cz.hostname
}
