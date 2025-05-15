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
# DNS for vmpkg.com
##

# TODO: go.vmpkg.com
# TODO: registry.vmpkg.com

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

##
# DNS for vmdevel.cz
##

data "cloudflare_record" "ingress_cthulhu_k8s_vxm_cz" {
  zone_id  = cloudflare_zone.vxm_cz.id
  hostname = "ingress.cthulhu.k8s.vxm.cz"
}

resource "cloudflare_record" "staging_yggdrasil_vmdevel_cz" {
  zone_id = cloudflare_zone.vmdevel_cz.id
  name    = "staging.yggdrasil"
  content = data.cloudflare_record.ingress_cthulhu_k8s_vxm_cz.hostname
  type    = "CNAME"
  proxied = false
}
