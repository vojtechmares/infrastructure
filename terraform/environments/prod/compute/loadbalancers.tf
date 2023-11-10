resource "hcloud_load_balancer" "mallard" {
  name               = "mallard"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "env" = "production"
  }
}

locals {
  cthulhu_node_ips = [
    "168.119.35.142",
    "116.202.114.83",
    "23.88.73.182",
  ]
}

resource "hcloud_load_balancer_target" "k8s_cthulhu_nodes" {
  count = length(local.cthulhu_node_ips)

  type             = "ip"
  ip               = local.cthulhu_node_ips[count.index]
  load_balancer_id = hcloud_load_balancer.mallard.id
}

resource "hcloud_load_balancer_service" "k8s_cthulhu_nodes_tcp_80" {
  load_balancer_id = hcloud_load_balancer.mallard.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
}

resource "hcloud_load_balancer_service" "k8s_cthulhu_nodes_tcp_443" {
  load_balancer_id = hcloud_load_balancer.mallard.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
}

resource "hcloud_load_balancer_service" "k8s_cthulhu_nodes_tcp_6443" {
  load_balancer_id = hcloud_load_balancer.mallard.id
  protocol         = "tcp"
  listen_port      = 6443
  destination_port = 6443
}

resource "cloudflare_record" "shrike_lb_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "shrike.lb"
  value   = hcloud_load_balancer.mallard.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "shrike_lb_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "shrike.lb"
  value   = hcloud_load_balancer.mallard.ipv6
  type    = "AAAA"
  proxied = false
}
