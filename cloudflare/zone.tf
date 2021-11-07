resource "cloudflare_zone" "vxm_cz" {
  zone = "vxm.cz"
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
  zone = "mares.work"
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
  zone = "mareshq.com"
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

resource "cloudflare_zone" "vmcr_cz" {
  zone = "vmcr.cz"
}

resource "cloudflare_zone_dnssec" "vmcr_cz" {
  zone_id = cloudflare_zone.vmcr_cz.id
}

resource "cloudflare_zone_settings_override" "vmcr_cz" {
  zone_id = cloudflare_zone.vmcr_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "flakame_se" {
  zone = "flakame.se"
}

resource "cloudflare_zone_dnssec" "flakame_se" {
  zone_id = cloudflare_zone.flakame_se.id
}

resource "cloudflare_zone_settings_override" "flakame_se" {
  zone_id = cloudflare_zone.flakame_se.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

module "vojtechmares_dev" {
  source = "./terraform-modules/cloudflare-zone/v1"

  zone = "vojtechmares.dev"
}

module "bf42_gg" {
  source = "./terraform-modules/cloudflare-zone/v1"

  zone = "bf42.gg"
}

module "statica_cloud" {
  source = "./terraform-modules/cloudflare-zone/v1"

  zone = "statica.cloud"
}

module "staticahq_com" {
  source = "./terraform-modules/cloudflare-zone/v1"

  zone = "staticahq.com"
}
