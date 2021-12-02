data "aws_region" "current" {}

output "aws_ses_smtp_address" {
  value       = "email-smtp.${data.aws_region.current.name}.amazonaws.com"
  description = "SMTP Address for SES"
}
