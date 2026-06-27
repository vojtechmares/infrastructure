locals {
  ssh_key_2025   = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGih3ohk5g9TQHP9Jmb1pKkwO3q1KDK4PWsfHxsLDV5T vojtech@mares.cz"
  vxm_cz_zone_id = "bac024cb43947f40e02a7491fc8d8f51"
}

resource "hcloud_ssh_key" "vojtechmares_2025" {
  name       = "vojtech@mares.cz"
  public_key = local.ssh_key_2025

  lifecycle {
    prevent_destroy = true
  }
}
