resource "hcloud_firewall" "bastion" {
  name = "bastion"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "0.0.0.0/0",
      "::/0"
    ]
  }

  // node_exporter via private network
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "9100"
    source_ips = [
      "172.16.0.0/12",
    ]
  }
}
