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

resource "hcloud_server_network" "postgres_to_private" {
  server_id = hcloud_server.postgres.id
  subnet_id = hcloud_network_subnet.standalone_machines.id
  ip        = cidrhost(hcloud_network_subnet.standalone_machines.ip_range, 2)
}

resource "hcloud_server_network" "prometheus_to_private" {
  server_id = hcloud_server.prometheus.id
  subnet_id = hcloud_network_subnet.standalone_machines.id
  ip        = cidrhost(hcloud_network_subnet.standalone_machines.ip_range, 3)
}

resource "hcloud_server_network" "kiwi_k8s_nodes_to_private" {
  count = length(hcloud_server.kiwi_k8s_nodes)

  server_id = hcloud_server.kiwi_k8s_nodes[count.index].id
  subnet_id = hcloud_network_subnet.kiwi_k8s_nodes.id
  ip        = cidrhost(hcloud_network_subnet.kiwi_k8s_nodes.ip_range, count.index + 1)
}
