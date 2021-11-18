module "vxm_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.vxm_cz.id
}

module "mares_work_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.mares_work.id
}

module "vmcr_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.vmcr_cz.id
}

module "flakame_se_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.flakame_se.id
}

module "bf42_gg_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.bf42_gg.zone.id
}

module "vojtechmares_dev_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vojtechmares_dev.zone.id
}

module "statica_cloud_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.statica_cloud.zone.id
}

module "staticahq_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.staticahq_com.zone.id
}

##
# DNS for vxm.cz
##
resource "cloudflare_record" "koala_vxm_cz" {
  zone_id = cloudflare_zone.vxm_cz.id
  name    = "koala"
  value   = "94.130.136.120"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "koala_vxm_cz_v6" {
  zone_id = cloudflare_zone.vxm_cz.id
  name    = "koala"
  value   = "2a01:4f8:13b:3387::2"
  type    = "AAAA"
  proxied = false
}

##
# DNS for mareshq.com
##
resource "cloudflare_record" "all_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "all"
  value   = "panda.k8s.oxs.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "sentry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "sentry"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_ip_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab-ip"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "registry_gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "registry.gitlab"
  value   = "gitlab.mareshq.com"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "uptime_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "uptime"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

# GitLab SES
resource "cloudflare_record" "ses_verification_gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "_amazonses.${aws_ses_domain_identity.gitlab.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.gitlab.verification_token
}

resource "cloudflare_record" "txt_dkim_gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.gitlab.dkim_tokens, count.index),
    cloudflare_zone.mareshq_com.zone,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.gitlab.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 1
  name    = "gitlab"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}

# DMARC TXT Record
resource "cloudflare_record" "txt_dmarc_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 1
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=none; rua=mailto:postmaster@${cloudflare_zone.mareshq_com.zone}; ruf=mailto:postmaster@${cloudflare_zone.mareshq_com.zone}; fo=1;"
}

# Sentry SES
resource "cloudflare_record" "ses_verification_sentry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "_amazonses.${aws_ses_domain_identity.sentry.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.sentry.verification_token
}

resource "cloudflare_record" "txt_dkim_sentry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.sentry.dkim_tokens, count.index),
    cloudflare_zone.mareshq_com.zone,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.sentry.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_sentry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 1
  name    = "sentry"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}
