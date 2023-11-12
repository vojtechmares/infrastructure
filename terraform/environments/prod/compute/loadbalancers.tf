locals {
  cthulhu_node_ips = [
    "168.119.35.142",
    "116.202.114.83",
    "23.88.73.182",
  ]
}

# mallard

resource "hcloud_load_balancer" "mallard" {
  name               = "mallard"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "env"    = "production"
    "target" = "k8s.control-plane"
    "k8s"    = "cthulhu"
  }
}

resource "hcloud_load_balancer_target" "mallard_k8s_cthulhu_nodes" {
  count = length(local.cthulhu_node_ips)

  type             = "ip"
  ip               = local.cthulhu_node_ips[count.index]
  load_balancer_id = hcloud_load_balancer.mallard.id
}

resource "hcloud_load_balancer_service" "mallard_k8s_cthulhu_nodes_tcp_6443" {
  load_balancer_id = hcloud_load_balancer.mallard.id
  protocol         = "tcp"
  listen_port      = 6443
  destination_port = 6443
}

resource "cloudflare_record" "mallard_lb_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "mallard.lb"
  value   = hcloud_load_balancer.mallard.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "mallard_lb_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "mallard.lb"
  value   = hcloud_load_balancer.mallard.ipv6
  type    = "AAAA"
  proxied = false
}

# chamios

resource "hcloud_load_balancer" "chamois" {
  name               = "chamois"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "env"    = "production"
    "target" = "k8s.ingress"
    "k8s"    = "cthulhu"
  }
}

resource "hcloud_load_balancer_target" "chamois_k8s_cthulhu_nodes" {
  count = length(local.cthulhu_node_ips)

  type             = "ip"
  ip               = local.cthulhu_node_ips[count.index]
  load_balancer_id = hcloud_load_balancer.chamois.id
}

resource "hcloud_load_balancer_service" "chamois_k8s_cthulhu_nodes_tcp_80" {
  load_balancer_id = hcloud_load_balancer.chamois.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 32080
  proxyprotocol    = true
}

resource "hcloud_load_balancer_service" "chamois_k8s_cthulhu_nodes_tcp_443" {
  load_balancer_id = hcloud_load_balancer.chamois.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 32443
  proxyprotocol    = true
}

resource "cloudflare_record" "chamois_lb_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "chamois.lb"
  value   = hcloud_load_balancer.chamois.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "chamois_lb_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "chamois.lb"
  value   = hcloud_load_balancer.chamois.ipv6
  type    = "AAAA"
  proxied = false
}
