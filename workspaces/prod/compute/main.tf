locals {
  ssh_key        = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUz21xFatGKfSwjeg/BOBus2Jn17o8xVthrMFAsDtRD iam@vojtechmares.com"
  vxm_cz_zone_id = "bac024cb43947f40e02a7491fc8d8f51"
}

resource "hcloud_ssh_key" "vojtechmares" {
  name       = "vojtechmares"
  public_key = local.ssh_key

  lifecycle {
    prevent_destroy = true
  }
}
