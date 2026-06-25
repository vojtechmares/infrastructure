locals {
  parking_ip = "82.208.18.158"
}

variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID"
}

resource "cloudflare_dns_record" "parking" {
  zone_id = var.zone_id
  name    = "@"
  type    = "A"
  content = local.parking_ip
  ttl     = 1
  proxied = true
}
