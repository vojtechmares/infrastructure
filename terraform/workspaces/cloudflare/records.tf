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

resource "cloudflare_record" "kangaroo_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "kangaroo"
  value   = "138.201.128.55"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "kangaroo_vxm_cz_v6" {
  zone_id = module.vxm_cz.zone.id
  name    = "kangaroo"
  value   = "2a01:4f8:172:2b60::1"
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "platypus_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "platypus"
  value   = "138.201.139.217"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "platypus_vxm_cz_v6" {
  zone_id = module.vxm_cz.zone.id
  name    = "platypus"
  value   = "2a01:4f8:172:36ce::1"
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wombat_vxm_cz" {
  zone_id = module.vxm_cz.zone.id
  name    = "wombat"
  value   = "138.201.33.183"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wombat_vxm_cz_v6" {
  zone_id = module.vxm_cz.zone.id
  name    = "wombat"
  value   = "2a01:4f8:171:3524::1"
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

resource "cloudflare_record" "mail_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "mail"
  value   = "aspen.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "smtp_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "smtp"
  value   = cloudflare_record.mail_mareshq_com.hostname
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "pop_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "pop"
  value   = cloudflare_record.mail_mareshq_com.hostname
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "imap_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "imap"
  value   = cloudflare_record.mail_mareshq_com.hostname
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "dmarc_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "_dmarc"
  value   = "v=DMARC1; p=none; rua=mailto:postmaster@mareshq.com; ruf=mailto:postmaster@mareshq.com fo=1; ri=86400;"
  type    = "TXT"
}

resource "cloudflare_record" "mx_mareshq_com" {
  zone_id  = module.mareshq_com.zone.id
  name     = "@"
  value    = cloudflare_record.mail_mareshq_com.hostname
  type     = "MX"
  priority = 1
}

resource "cloudflare_record" "dkim_mareshq_com" {
  zone_id = module.mareshq_com.zone.id
  name    = "s20220409801._domainkey"
  value   = "k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA1PN3UpMIr05SvqFvJyD42w5s97jeRNoqKCRR2rBIhqULIo42T5yHtqysleXvXFN44nsyKmH3iftom9magfRZ2njd/eaLquzDJC4Ybu+X/WuCathhjhIA4JHavl0ivp8TBa0CJxupmwOnopypPxB4UDp/QLunQthxyPG0zeqyy+MKhVX8sDVPGw7kCdxmwco1rQsN7+FtM5420RNmEbz8U6Ngvn6g/fvXW1T8GN2eV5OzNMbZ+9SCq1TbOKvJ+Qzzzvy2bIuo5+XY0NwWvnz8aCOKVZFlwvzZ9jpSThQ8MvKxU2jWPFnp8J66uj6JpM2KMMGAC+Cq6XfjL1ZSLIZ1rQIDAQAB"
  type    = "TXT"
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
