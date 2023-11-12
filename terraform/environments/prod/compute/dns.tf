resource "cloudflare_record" "cthulhu_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "cthulhu.k8s"
  value   = hcloud_load_balancer.mallard.ipv4
  type    = "A"
  proxied = false
}

# Cthulhu nodes DNS records
resource "cloudflare_record" "zebra_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "zebra"
  value   = "116.202.114.83"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "camel_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "camel"
  value   = "116.202.114.83"
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "raven_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "raven"
  value   = "168.119.35.142"
  type    = "A"
  proxied = false
}
