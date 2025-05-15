##
# DNS for mareshq.com
##

resource "cloudflare_record" "signpost_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "signpost"
  content = "cname.vercel-dns.com."
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "gitlab_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "gitlab"
  content = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "registry_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "registry"
  content = "buffalo.vxm.cz"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "spf_mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  name    = "@"
  content = "v=spf1 mx ~all"
  type    = "TXT"
}

##
# DNS for devopsvkapse.cz
##

resource "cloudflare_record" "devopsvkapse_cz" {
  zone_id = cloudflare_zone.devopsvkapse_cz.id
  name    = "@"
  content = "178.128.137.126"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "www_devopsvkapse_cz" {
  zone_id = cloudflare_zone.devopsvkapse_cz.id
  name    = "www"
  content = "devops-v-kapse.ghost.io"
  type    = "CNAME"
  proxied = false
}
