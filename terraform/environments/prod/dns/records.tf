##
# DNS for vxm.cz
##

resource "cloudflare_record" "maple_vxm_cz" {
  zone_id = cloudflare_zone.vxm_cz.id
  name    = "maple"
  value   = "138.201.254.39"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "maple_vxm_cz_v6" {
  zone_id = cloudflare_zone.vxm_cz.id
  name    = "maple"
  value   = "2a01:4f8:173:250c::1"
  type    = "AAAA"
  proxied = false
}

##
# DNS for mareshq.com
##

resource "cloudflare_record" "prometheus_ops_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "prometheus.ops"
  value   = "prometheus.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "alertmanager_ops_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "alertmanager.ops"
  value   = "prometheus.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "grafana_ops_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "grafana.ops"
  value   = "prometheus.vxm.cz"
  type    = "CNAME"
  proxied = false
}

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
  value   = "kiwi.k8s.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "staging_backoffice_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "staging.backoffice"
  value   = "kiwi.k8s.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "sso_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "sso"
  value   = "kiwi.k8s.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "all_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "all"
  value   = "panda.k8s.oxs.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab"
  value   = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "gitlab_ip_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab-ip"
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

resource "cloudflare_record" "rancher_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "rancher"
  value   = "rancher.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "cdn_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "cdn"
  value   = "vojtechmares.github.io"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "spf_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "@"
  value   = "v=spf1 mx ~all"
  type    = "TXT"
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
    cloudflare_record.gitlab_mareshq_com.hostname,
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

# Keycloak SES (MaresHQ SSO)
resource "cloudflare_record" "ses_verification_keycloak_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "_amazonses.${aws_ses_domain_identity.keycloak.id}"
  type    = "TXT"
  value   = aws_ses_domain_identity.keycloak.verification_token
}

resource "cloudflare_record" "txt_dkim_keycloak_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 3
  name = format(
    "%s._domainkey.%s",
    element(aws_ses_domain_dkim.keycloak.dkim_tokens, count.index),
    cloudflare_record.sso_mareshq_com.hostname,
  )
  type  = "CNAME"
  value = "${element(aws_ses_domain_dkim.keycloak.dkim_tokens, count.index)}.dkim.amazonses.com"
}

resource "cloudflare_record" "txt_spf_keycloak_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  count   = 1
  name    = cloudflare_record.sso_mareshq_com.hostname
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
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

resource "cloudflare_record" "map_together_acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  name    = "map.together"
  value   = "acas-minecraft-server-worldmap.s3-website.eu-central-1.amazonaws.com"
  type    = "CNAME"
  proxied = true
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
