##
# DNS for mareshq.com
##

resource "cloudflare_record" "signpost_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "signpost"
  value   = "cname.vercel-dns.com."
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "backoffice_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "backoffice"
  value   = "magpie.lb.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "staging_backoffice_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "staging.backoffice"
  value   = "magpie.lb.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "sso_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "sso"
  value   = "chamois.lb.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "registry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "registry"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "cdn_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "cdn"
  value   = "vojtechmares.github.io"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "status_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "status"
  value   = "shrike.lb.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "spf_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "@"
  value   = "v=spf1 mx ~all"
  type    = "TXT"
}

##
# acaslab.com
##
resource "cloudflare_record" "panel_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "panel"
  value   = "alder.vxm.cz"
  type    = "CNAME"
  proxied = false
}

# panel.acaslab.com SES
resource "cloudflare_record" "ses_verification_panel_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "_amazonses.${aws_ses_domain_identity.panel_acaslab.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.panel_acaslab.verification_token
}

resource "cloudflare_record" "txt_dkim_panel_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.panel_acaslab.dkim_tokens, count.index),
    cloudflare_record.panel_acaslab_com.hostname,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.panel_acaslab.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_panel_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  count   = 1
  name    = "panel"
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}

resource "cloudflare_record" "github_pages_verification_docs_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "_github-pages-challenge-acaslab.docs"
  value   = "0f6908ad28827680f8bef3ee774f8f"
  type    = "TXT"
}

resource "cloudflare_record" "github_pages_cname_docs_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "docs"
  value   = "acaslab.github.io"
  type    = "CNAME"
}

resource "cloudflare_record" "github_pages_verification_helm_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "_github-pages-challenge-acaslab.helm"
  value   = "68effa9228fb636650ad72187bfdba"
  type    = "TXT"
}

resource "cloudflare_record" "github_pages_cname_helm_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "helm"
  value   = "acaslab.github.io"
  type    = "CNAME"
}

##
# DNS for vmpkg.com
##
