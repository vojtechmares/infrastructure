module "vxm_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vxm_cz.zone.id
}

module "mares_work_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.mares_work.zone.id
}

module "vmcr_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vmcr_cz.zone.id
}

module "flakame_se_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.flakame_se.zone.id
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

module "goplaintext_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.goplaintext_com.zone.id
}

##
# DNS for vxm.cz
##
resource "cloudflare_record" "koala_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "koala"
  value   = "94.130.136.120"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "koala_vxm_cz_v6" {
  zone_id = module.vxm_cz.zone.id
  name    = "koala"
  value   = "2a01:4f8:13b:3387::2"
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "platypus_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "platypus"
  value   = "144.76.183.92"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "kangaroo_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "kangaroo"
  value   = "144.76.218.5"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wombat_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "wombat"
  value   = "138.201.80.22"
  type    = "A"
  proxied = false
}

##
# DNS for mareshq.com
##
resource "cloudflare_record" "all_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "all"
  value   = "panda.k8s.oxs.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "sentry"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "gitlab"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_ip_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "gitlab-ip"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "registry_gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "registry.gitlab"
  value   = "gitlab.mareshq.com"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "uptime_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "uptime"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "survival_flakame_se" {
  zone_id = module.flakame_se.zone.id
  name    = "survival"
  value   = "koala.vxm.cz"
  type    = "CNAME"
  proxied = false
}

# GitLab SES
resource "cloudflare_record" "ses_verification_gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "_amazonses.${aws_ses_domain_identity.gitlab.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.gitlab.verification_token
}

resource "cloudflare_record" "txt_dkim_gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.gitlab.dkim_tokens, count.index),
    module.mareshq_com.zone.zone,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.gitlab.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  count   = 1
  name    = "gitlab"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}

# DMARC TXT Record
resource "cloudflare_record" "txt_dmarc_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  count   = 1
  name    = "_dmarc"
  type    = "TXT"
  value   = "v=DMARC1; p=none; rua=mailto:postmaster@${module.mareshq_com.zone.zone}; ruf=mailto:postmaster@${module.mareshq_com.zone.zone}; fo=1;"
}

# Sentry SES
resource "cloudflare_record" "ses_verification_sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "_amazonses.${aws_ses_domain_identity.sentry.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.sentry.verification_token
}

resource "cloudflare_record" "txt_dkim_sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.sentry.dkim_tokens, count.index),
    module.mareshq_com.zone.zone,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.sentry.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  count   = 1
  name    = "sentry"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}
