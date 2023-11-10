resource "cloudflare_record" "cthulhu_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "cthulhu.k8s"
  value   = hcloud_load_balancer.mallard.ipv4
  type    = "A"
  proxied = false
}
