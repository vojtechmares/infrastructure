##
# DNS for mares.cz
##

resource "cloudflare_dns_record" "spf_mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  name    = "mares.cz"
  content = "\"v=spf1 include:_spf.google.com ~all\""
  type    = "TXT"
  ttl     = 3600
}

resource "cloudflare_dns_record" "dmarc_mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  name    = "_dmarc.mares.cz"
  content = "\"v=DMARC1; p=none; rua=mailto:28d5580aaf1f4bbd87d5d3c732333fde@dmarc-reports.cloudflare.net,mailto:vojtech@mares.cz, mailto:vojtech@mares.cz; pct=100; adkim=s; aspf=s\""
  type    = "TXT"
  ttl     = 1
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
