locals {
  ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEUz21xFatGKfSwjeg/BOBus2Jn17o8xVthrMFAsDtRD iam@vojtechmares.com"
}

resource "hcloud_ssh_key" "vojtechmares" {
  name       = "vojtechmares"
  public_key = local.ssh_key

  lifecycle {
    prevent_destroy = true
  }
}
