locals {
  # RFC 5737 documentation address. The records are proxied and exist only so
  # requests reach Cloudflare's edge, where the redirect below is applied - the
  # origin is never contacted.
  placeholder_ip = "192.0.2.1"
}

resource "cloudflare_dns_record" "apex" {
  zone_id = var.zone_id
  name    = var.zone_name
  type    = "A"
  content = local.placeholder_ip
  ttl     = 1
  proxied = true
}

resource "cloudflare_dns_record" "www" {
  zone_id = var.zone_id
  name    = "www.${var.zone_name}"
  type    = "A"
  content = local.placeholder_ip
  ttl     = 1
  proxied = true
}

resource "cloudflare_ruleset" "redirect" {
  zone_id = var.zone_id
  name    = "Static redirect to ${var.target_url}"
  kind    = "zone"
  phase   = "http_request_dynamic_redirect"

  rules = [{
    ref         = "redirect_all_hostnames"
    description = "Redirect the apex and www to ${var.target_url}"
    expression  = "(http.host eq \"${var.zone_name}\") or (http.host eq \"www.${var.zone_name}\")"
    action      = "redirect"
    action_parameters = {
      from_value = {
        status_code           = var.status_code
        preserve_query_string = var.preserve_query_string
        target_url = {
          value = var.target_url
        }
      }
    }
  }]
}
