resource "cloudflare_record" "wildcard_cherry_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.cherry.k8s"
  value   = cloudflare_record.shrike_lb_vxm_cz.hostname
  type    = "CNAME"
  proxied = false
}

resource "cloudflare_record" "wildcard_lychee_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.lychee.k8s"
  value   = cloudflare_record.magpie_lb_vxm_cz.hostname
  type    = "CNAME"
  proxied = false
}
