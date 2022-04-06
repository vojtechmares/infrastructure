resource "hcloud_load_balancer" "ant_k8s" {
  name               = "ant-k8s"
  load_balancer_type = "lb11"
  location           = "fsn1"
}

resource "hcloud_load_balancer_target" "platypus" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  ip               = "138.201.139.217"
}

resource "hcloud_load_balancer_target" "kangaroo" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  ip               = "138.201.128.55"
}

resource "hcloud_load_balancer_target" "wombat" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  ip               = "138.201.33.183"
}

resource "hcloud_load_balancer_service" "tcp_80" {
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
}

resource "hcloud_load_balancer_service" "tcp_443" {
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
}

resource "hcloud_load_balancer_service" "tcp_6443" {
  load_balancer_id = hcloud_load_balancer.ant_k8s.id
  protocol         = "tcp"
  listen_port      = 6443
  destination_port = 6443
}

resource "cloudflare_record" "ant_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "ant.k8s"
  value   = hcloud_load_balancer.ant_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "ant_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "ant.k8s"
  value   = hcloud_load_balancer.ant_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard_ant_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.ant.k8s"
  value   = hcloud_load_balancer.ant_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wildcard_ant_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.ant.k8s"
  value   = hcloud_load_balancer.ant_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

output "ant_k8s_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.ant_k8s.ipv4,
    ipv6 = hcloud_load_balancer.ant_k8s.ipv6,
  }
}
