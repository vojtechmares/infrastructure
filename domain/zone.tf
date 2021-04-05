locals {
  vxm_cz_domain         = "vxm.cz"
  mares_work_domain     = "mares.work"
  mareshq_com_domain    = "mareshq.com"
  vojtamares_com_domain = "vojtamares.com"
}

resource "cloudflare_zone" "vxm_cz" {
  zone = local.vxm_cz_domain
}

resource "cloudflare_zone_dnssec" "vxm_cz" {
  zone_id = cloudflare_zone.vxm_cz.id
}

resource "cloudflare_zone_settings_override" "vxm_cz" {
  zone_id = cloudflare_zone.vxm_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "mares_work" {
  zone = local.mares_work_domain
}

resource "cloudflare_zone_dnssec" "mares_work" {
  zone_id = cloudflare_zone.mares_work.id
}

resource "cloudflare_zone_settings_override" "mares_work" {
  zone_id = cloudflare_zone.mares_work.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "mareshq_com" {
  zone = local.mareshq_com_domain
}

resource "cloudflare_zone_dnssec" "mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
}

resource "cloudflare_zone_settings_override" "mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

# resource "cloudflare_zone" "vojtamares_com" {
#   zone = local.vojtamares_com_domain
# }
#
# resource "cloudflare_zone_dnssec" "vojtamares_com" {
#   zone_id = cloudflare_zone.vojtamares_com.id
# }
#
# resource "cloudflare_zone_settings_override" "vojtamares_com" {
#   zone_id = cloudflare_zone.vojtamares_com.id
#   settings {
#     always_use_https         = "on"
#     automatic_https_rewrites = "on"
#     ssl                      = "full"
#   }
# }
#
# output "vojtamares_com" {
#   value = cloudflare_zone.vojtamares_com.name_servers
# }
