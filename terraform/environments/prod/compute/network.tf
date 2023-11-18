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
