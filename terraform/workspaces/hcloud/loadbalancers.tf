resource "hcloud_load_balancer" "bee_k8s" {
  name               = "bee-k8s"
  load_balancer_type = "lb11"
  location           = "fsn1"
}

resource "hcloud_load_balancer_target" "loris" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
  ip               = "142.132.144.165"
}

resource "hcloud_load_balancer_target" "otary" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
  ip               = "167.235.7.102"
}

resource "hcloud_load_balancer_target" "rhino" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
  ip               = "167.235.7.101"
}

resource "hcloud_load_balancer_target" "nodes_bee_k8s" {
  count = length(hcloud_server.nodes_bee_k8s)

  type             = "server"
  server_id        = hcloud_server.nodes_bee_k8s[count.index].id
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
}

resource "hcloud_load_balancer_service" "tcp_80" {
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
}

resource "hcloud_load_balancer_service" "tcp_443" {
  load_balancer_id = hcloud_load_balancer.bee_k8s.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
}

resource "cloudflare_record" "bee_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "bee.k8s"
  value   = hcloud_load_balancer.bee_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "bee_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "bee.k8s"
  value   = hcloud_load_balancer.bee_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard_bee_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.bee.k8s"
  value   = hcloud_load_balancer.bee_k8s.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "wildcard_bee_k8s_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.bee.k8s"
  value   = hcloud_load_balancer.bee_k8s.ipv6
  type    = "AAAA"
  proxied = false
}

output "bee_k8s_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.bee_k8s.ipv4,
    ipv6 = hcloud_load_balancer.bee_k8s.ipv6,
  }
}
