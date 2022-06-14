module "vxm_cz" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "vxm.cz"
}

module "mares_work" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "mares.work"
}

module "mareshq_com" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "mareshq.com"
}

# resource "cloudflare_zone" "vojtamares_com" {
#   zone = "vojtamares.com"
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

module "flakame_se" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "flakame.se"
}

module "vojtechmares_dev" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "vojtechmares.dev"
}

module "bf42_gg" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "bf42.gg"
}

module "goplaintext_com" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "goplaintext.com"
}

module "acaslab_com" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "acaslab.com"
}

module "makejted_cz" {
  source  = "gitlab.mareshq.com/mareshq/cloudflare-zone/cloudflare"
  version = "2.0.0"

  zone = "makejted.cz"
}
