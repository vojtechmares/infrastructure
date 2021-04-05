variable "zone_id" {
  type = string
}

resource "cloudflare_record" "spf" {
  zone_id = var.zone_id
  name    = "@"
  value   = "v=spf1 -all"
  type    = "TXT"
}

resource "cloudflare_record" "mx" {
  zone_id  = var.zone_id
  name     = "@"
  value    = "."
  type     = "MX"
  priority = 0
}

resource "cloudflare_record" "dmarc" {
  zone_id = var.zone_id
  name    = "_dmarc"
  value   = "v=DMARC1; p=reject;"
  type    = "TXT"
}
