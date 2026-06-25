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

##
# DNS for devopsvkapse.cz
##

resource "cloudflare_dns_record" "devopsvkapse_cz" {
  zone_id = cloudflare_zone.devopsvkapse_cz.id
  name    = "devopsvkapse.cz"
  content = "142.132.243.16"
  type    = "A"
  ttl     = 1
  proxied = true
}
