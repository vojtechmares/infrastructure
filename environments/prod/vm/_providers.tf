provider "cloudflare" {
  email   = var.email
  api_key = var.cloudflare_api_key
}

provider "hcloud" {
  token = var.hcloud_token
}
