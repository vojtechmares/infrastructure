
resource "cloudflare_record" "ses_verification_mail_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "_amazonses.${aws_ses_domain_identity.ses_mail_mareshq_com.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.ses_mail_mareshq_com.verification_token
}

resource "cloudflare_record" "txt_dkim_mail_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.ses_mail_mareshq_com.dkim_tokens, count.index),
    "mail.mareshq.com",
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.ses_mail_mareshq_com.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_mail_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 1
  name    = "mail"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}


resource "aws_iam_user" "ses_mail_mareshq_com" {
  name = "mail-mareshq-com"
}

data "aws_iam_policy_document" "ses_mail_mareshq_com" {
  statement {
    effect    = "Allow"
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "ses_mail_mareshq_com" {
  user   = aws_iam_user.ses_mail_mareshq_com.name
  policy = data.aws_iam_policy_document.ses_mail_mareshq_com.json
}

resource "aws_iam_access_key" "ses_mail_mareshq_com" {
  user = aws_iam_user.ses_mail_mareshq_com.name
}

output "ses_mail_mareshq_com_access_key" {
  value       = aws_iam_access_key.ses_mail_mareshq_com.id
  description = "Access key for SES for Keycloak"
  sensitive   = true
}

output "ses_mail_mareshq_com_smtp_password_v4" {
  value       = aws_iam_access_key.ses_mail_mareshq_com.ses_smtp_password_v4
  description = "SES SMTP password for SES for mail.mareshq.com"
  sensitive   = true
}

# Domain indentity & veritification
resource "aws_ses_domain_identity" "ses_mail_mareshq_com" {
  domain = "mail.mareshq.com"
}

resource "aws_ses_domain_identity_verification" "ses_mail_mareshq_com" {
  count      = 1
  domain     = aws_ses_domain_identity.ses_mail_mareshq_com.id
  depends_on = [cloudflare_record.ses_verification_mail_mareshq_com]
}

# DKIM
resource "aws_ses_domain_dkim" "ses_mail_mareshq_com" {
  domain = "mail.mareshq.com"
}
