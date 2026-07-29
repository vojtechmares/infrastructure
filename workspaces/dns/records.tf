##
# DNS for mares.cz
##

resource "cloudflare_dns_record" "spf_mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  name    = "mares.cz"
  content = "\"v=spf1 include:_spf.google.com -all\""
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_dns_record" "dmarc_mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  name    = "_dmarc.mares.cz"
  content = "\"v=DMARC1; p=quarantine; sp=reject; rua=mailto:28d5580aaf1f4bbd87d5d3c732333fde@dmarc-reports.cloudflare.net; pct=100; adkim=s; aspf=s\""
  type    = "TXT"
  ttl     = 1
}

##
# DNS for vojtamares.cz
##
# Mail is hosted on iCloud+ Custom Email Domain.

resource "cloudflare_dns_record" "mx01_vojtamares_cz" {
  zone_id  = cloudflare_zone.vojtamares_cz.id
  name     = "vojtamares.cz"
  content  = "mx01.mail.icloud.com"
  type     = "MX"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "mx02_vojtamares_cz" {
  zone_id  = cloudflare_zone.vojtamares_cz.id
  name     = "vojtamares.cz"
  content  = "mx02.mail.icloud.com"
  type     = "MX"
  priority = 10
  ttl      = 1
}

resource "cloudflare_dns_record" "spf_vojtamares_cz" {
  zone_id = cloudflare_zone.vojtamares_cz.id
  name    = "vojtamares.cz"
  content = "\"v=spf1 include:icloud.com ~all\""
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_dns_record" "dmarc_vojtamares_cz" {
  zone_id = cloudflare_zone.vojtamares_cz.id
  name    = "_dmarc.vojtamares.cz"
  content = "\"v=DMARC1; p=none; rua=mailto:247b37b4c95e4a9783e0f4853d6b0ab5@dmarc-reports.cloudflare.net\""
  type    = "TXT"
  ttl     = 1
}

resource "cloudflare_dns_record" "dkim_vojtamares_cz" {
  zone_id = cloudflare_zone.vojtamares_cz.id
  name    = "sig1._domainkey.vojtamares.cz"
  content = "sig1.dkim.vojtamares.cz.at.icloudmailadmin.com"
  type    = "CNAME"
  ttl     = 1
  proxied = false
}

##
# DNS for mareshq.com
##

resource "cloudflare_dns_record" "spf_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "mareshq.com"
  content = "\"v=spf1 mx ~all\""
  type    = "TXT"
  ttl     = 1
}
