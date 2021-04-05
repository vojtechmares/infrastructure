resource "digitalocean_ssh_key" "vojtechmares" {
  name       = "vojtechmares"
  public_key = local.ssh_key

  lifecycle {
    prevent_destroy = true
  }
}
