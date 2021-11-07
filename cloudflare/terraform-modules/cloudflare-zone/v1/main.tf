variable "zone" {
  type = string
}

variable "always_use_https" {
  type    = string
  default = "on"
}

variable "automatic_https_rewrites" {
  type    = string
  default = "on"
}

variable "ssl" {
  type    = string
  default = "full"
}

resource "cloudflare_zone" "zone" {
  zone = var.zone
}

resource "cloudflare_zone_dnssec" "dnssec" {
  zone_id = cloudflare_zone.zone.id
}

resource "cloudflare_zone_settings_override" "settings_override" {
  zone_id = cloudflare_zone.zone.id
  settings {
    always_use_https         = var.always_use_https
    automatic_https_rewrites = var.automatic_https_rewrites
    ssl                      = var.ssl
  }
}

output "zone" {
  value = cloudflare_zone.zone
}
