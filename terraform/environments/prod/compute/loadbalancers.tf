resource "hcloud_load_balancer" "kiwi_k8s" {
  name               = "kiwi-k8s"
  load_balancer_type = "lb11"
  location           = "fsn1"
}

resource "hcloud_load_balancer_target" "nodes_kiwi_k8s" {
  count = length(hcloud_server.kiwi_k8s_nodes)

  type             = "server"
  server_id        = hcloud_server.kiwi_k8s_nodes[count.index].id
  load_balancer_id = hcloud_load_balancer.kiwi_k8s.id
}

resource "hcloud_load_balancer_service" "tcp_80" {
  load_balancer_id = hcloud_load_balancer.kiwi_k8s.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
}

resource "hcloud_load_balancer_service" "tcp_443" {
  load_balancer_id = hcloud_load_balancer.kiwi_k8s.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
}

resource "cloudflare_record" "kiwi_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "kiwi.k8s"
  value   = hcloud_load_balancer.kiwi_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "kiwi_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "kiwi.k8s"
  value   = hcloud_load_balancer.kiwi_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard_kiwi_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.kiwi.k8s"
  value   = hcloud_load_balancer.kiwi_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wildcard_kiwi_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.kiwi.k8s"
  value   = hcloud_load_balancer.kiwi_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

output "kiwi_k8s_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.kiwi_k8s.ipv4,
    ipv6 = hcloud_load_balancer.kiwi_k8s.ipv6,
  }
}
