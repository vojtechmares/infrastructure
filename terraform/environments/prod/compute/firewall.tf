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

resource "hcloud_firewall_attachment" "bastion_ssh_to_bastion" {
  firewall_id = hcloud_firewall.bastion.id
  server_ids  = [hcloud_server.bastion.id]
}
