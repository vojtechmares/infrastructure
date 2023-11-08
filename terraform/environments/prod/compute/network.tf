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
