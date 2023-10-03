resource "hcloud_network" "private" {
  name     = "private"
  ip_range = "172.16.0.0/12"
}

resource "hcloud_network_subnet" "standalone_machines" {
  network_id   = hcloud_network.private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = cidrsubnet(hcloud_network.private.ip_range, 12, 1)
}

resource "hcloud_server_network" "bastion_to_private" {
  server_id = hcloud_server.bastion.id
  subnet_id = hcloud_network_subnet.standalone_machines.id
  ip        = cidrhost(hcloud_network_subnet.standalone_machines.ip_range, 1)
}

resource "hcloud_server_network" "postgres_to_private" {
  server_id = hcloud_server.postgres.id
  subnet_id = hcloud_network_subnet.standalone_machines.id
  ip        = cidrhost(hcloud_network_subnet.standalone_machines.ip_range, 2)
}

resource "hcloud_network_subnet" "k8s_cherry" {
  network_id   = hcloud_network.private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = cidrsubnet(hcloud_network.private.ip_range, 12, 140)
}

resource "hcloud_server_network" "k8s_cherry_to_private" {
  count = length(hcloud_server.k8s_cherry_nodes)

  server_id = hcloud_server.k8s_cherry_nodes[count.index].id
  subnet_id = hcloud_network_subnet.k8s_cherry.id
  ip        = cidrhost(hcloud_network_subnet.k8s_cherry.ip_range, count.index + 1)
}

resource "hcloud_load_balancer_network" "shrike_to_private" {
  load_balancer_id = hcloud_load_balancer.shrike.id
  network_id       = hcloud_network.private.id
  ip               = cidrhost(hcloud_network_subnet.k8s_cherry.ip_range, 250)
}

resource "hcloud_network_subnet" "k8s_lychee" {
  network_id   = hcloud_network.private.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = cidrsubnet(hcloud_network.private.ip_range, 12, 152)
}

resource "hcloud_server_network" "k8s_lychee_to_private" {
  count = length(hcloud_server.k8s_lychee_nodes)

  server_id = hcloud_server.k8s_lychee_nodes[count.index].id
  subnet_id = hcloud_network_subnet.k8s_lychee.id
  ip        = cidrhost(hcloud_network_subnet.k8s_lychee.ip_range, count.index + 1)
}

resource "hcloud_load_balancer_network" "magpie_to_private" {
  load_balancer_id = hcloud_load_balancer.magpie.id
  network_id       = hcloud_network.private.id
  ip               = cidrhost(hcloud_network_subnet.k8s_cherry.ip_range, 251)
}
