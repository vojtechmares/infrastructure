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

module "makejted_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.makejted_cz.zone.id
}

##
# DNS for vxm.cz
##

resource "cloudflare_record" "maple_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "maple"
  value   = "138.201.254.39"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "maple_vxm_cz_v6" {
  zone_id = module.vxm_cz.zone.id
  name    = "maple"
  value   = "2a01:4f8:173:250c::1"
  type    = "AAAA"
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

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "gitlab"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_ip_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "gitlab-ip"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "registry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "registry"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "sentry"
  value   = "opossum.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "status_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "status"
  value   = "rowan.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "spf_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "@"
  value   = "v=spf1 mx ~all"
  type    = "TXT"
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
    cloudflare_record.gitlab_mareshq_com.hostname,
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
    cloudflare_record.sentry_mareshq_com.hostname,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.sentry.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_sentry_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "sentry"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}

resource "cloudflare_record" "panel_flakame_se" {
  zone_id = module.flakame_se.zone.id
  name    = "panel"
  value   = "alder.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "panel_acaslab_com" {
  zone_id = module.acaslab_com.zone.id
  name    = "panel"
  value   = "alder.vxm.cz"
  type    = "CNAME"
  proxied = false
}

##
# DNS for makejted.cz
##
resource "cloudflare_record" "ukolnicek_makejted_cz" {
  zone_id = module.makejted_cz.zone.id
  name    = "ukolnicek"
  value   = "willow.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "ses_verification_ukolnicek_makejted_cz" {
  zone_id = module.makejted_cz.zone.id
  name    = "_amazonses.${aws_ses_domain_identity.ukolnicek_jamboree.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.ukolnicek_jamboree.verification_token
}

resource "cloudflare_record" "txt_dkim_ukolnicek_makejted_cz" {
  zone_id = module.makejted_cz.zone.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.ukolnicek_jamboree.dkim_tokens, count.index),
    cloudflare_record.ukolnicek_makejted_cz.hostname,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.ukolnicek_jamboree.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_ukolnicek_makejted_cz" {
  zone_id = module.makejted_cz.zone.id
  name    = "ukolnicek"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}
