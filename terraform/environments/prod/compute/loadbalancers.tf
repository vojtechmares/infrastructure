resource "hcloud_load_balancer" "shrike" {
  name               = "shrike"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "env" = "production"
  }
}

resource "hcloud_load_balancer_target" "k8s_cherry_nodes" {
  count = length(hcloud_server.k8s_cherry_nodes)

  type             = "server"
  server_id        = hcloud_server.k8s_cherry_nodes[count.index].id
  load_balancer_id = hcloud_load_balancer.shrike.id
}

resource "hcloud_load_balancer_service" "k8s_cherry_nodes_tcp_80" {
  load_balancer_id = hcloud_load_balancer.shrike.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 80
}

resource "hcloud_load_balancer_service" "k8s_cherry_nodes_tcp_443" {
  load_balancer_id = hcloud_load_balancer.shrike.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 443
}

resource "cloudflare_record" "shrike_lb_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "shrike.lb"
  value   = hcloud_load_balancer.shrike.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "shrike_lb_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "shrike.lb"
  value   = hcloud_load_balancer.shrike.ipv6
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard_cherry_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.cherry.k8s"
  value   = cloudflare_record.shrike_lb_vxm_cz.hostname
  type    = "CNAME"
  proxied = false
}


output "shrike_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.shrike.ipv4,
    ipv6 = hcloud_load_balancer.shrike.ipv6,
  }
}

resource "hcloud_load_balancer" "magpie" {
  name               = "magpie"
  load_balancer_type = "lb11"
  location           = "fsn1"
  labels = {
    "env" = "production"
  }
}

resource "hcloud_load_balancer_target" "k8s_lychee_nodes" {
  count = length(hcloud_server.k8s_lychee_nodes)

  type             = "server"
  server_id        = hcloud_server.k8s_lychee_nodes[count.index].id
  load_balancer_id = hcloud_load_balancer.magpie.id
}

resource "hcloud_load_balancer_service" "k8s_lychee_nodes_tcp_80" {
  load_balancer_id = hcloud_load_balancer.magpie.id
  protocol         = "tcp"
  listen_port      = 80
  destination_port = 32080
  proxyprotocol    = true
}

resource "hcloud_load_balancer_service" "k8s_lychee_nodes_tcp_443" {
  load_balancer_id = hcloud_load_balancer.magpie.id
  protocol         = "tcp"
  listen_port      = 443
  destination_port = 32443
  proxyprotocol    = true
}

resource "cloudflare_record" "magpie_lb_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "magpie.lb"
  value   = hcloud_load_balancer.magpie.ipv4
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "magpie_lb_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "magpie.lb"
  value   = hcloud_load_balancer.magpie.ipv6
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "wildcard_lychee_k8s_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "*.lychee.k8s"
  value   = cloudflare_record.magpie_lb_vxm_cz.hostname
  type    = "CNAME"
  proxied = false
}


output "magpie_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.magpie.ipv4,
    ipv6 = hcloud_load_balancer.magpie.ipv6,
  }
}
