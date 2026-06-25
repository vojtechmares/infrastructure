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
