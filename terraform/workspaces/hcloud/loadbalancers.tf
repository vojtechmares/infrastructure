resource "hcloud_load_balancer" "octopus_k8s" {
  name               = "octopus-kubernetes"
  load_balancer_type = "lb11"
  location           = "fsn1"
}

resource "hcloud_load_balancer_target" "platypus" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.octopus_k8s.id
  ip               = "144.76.183.92"
}

resource "hcloud_load_balancer_target" "kangaroo" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.octopus_k8s.id
  ip               = "144.76.218.5"
}

resource "hcloud_load_balancer_target" "wombat" {
  type             = "ip"
  load_balancer_id = hcloud_load_balancer.octopus_k8s.id
  ip               = "138.201.80.22"
}

resource "hcloud_load_balancer_service" "tcp_80" {
    load_balancer_id = hcloud_load_balancer.octopus_k8s.id
    protocol         = "tcp"
    listen_port      = 80
    destination_port = 30080
    proxyprotocol    = true
}

resource "hcloud_load_balancer_service" "tcp_443" {
    load_balancer_id = hcloud_load_balancer.octopus_k8s.id
    protocol         = "tcp"
    listen_port      = 443
    destination_port = 30443
    proxyprotocol    = true
}

resource "hcloud_load_balancer_service" "tcp_6443" {
    load_balancer_id = hcloud_load_balancer.octopus_k8s.id
    protocol         = "tcp"
    listen_port      = 6443
    destination_port = 6443
    proxyprotocol    = true
}

resource "hcloud_load_balancer_service" "tcp_6022" {
    load_balancer_id = hcloud_load_balancer.octopus_k8s.id
    protocol         = "tcp"
    listen_port      = 6022
    destination_port = 36022
    proxyprotocol    = true
}

output "octopus_k8s_lb_ip" {
  value = {
    ipv4 = hcloud_load_balancer.octopus_k8s.ipv4,
    ipv6 = hcloud_load_balancer.octopus_k8s.ipv6,
  }
}
