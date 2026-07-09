# Static redirects for training microsites. Each zone serves a single 301 to a
# page on www.mares.cz; see modules/domain-redirect/v1.

module "devops_skoleni_cz_redirect" {
  source      = "../../modules/domain-redirect/v1"
  zone_id     = cloudflare_zone.devops_skoleni_cz.id
  zone_name   = cloudflare_zone.devops_skoleni_cz.name
  target_url  = "https://www.mares.cz/skoleni/verejne-terminy"
  status_code = 301
}

module "devops_akademie_cz_redirect" {
  source      = "../../modules/domain-redirect/v1"
  zone_id     = cloudflare_zone.devops_akademie_cz.id
  zone_name   = cloudflare_zone.devops_akademie_cz.name
  target_url  = "https://www.mares.cz/akademie"
  status_code = 301
}

module "devopsakademie_cz_redirect" {
  source      = "../../modules/domain-redirect/v1"
  zone_id     = cloudflare_zone.devopsakademie_cz.id
  zone_name   = cloudflare_zone.devopsakademie_cz.name
  target_url  = "https://www.mares.cz/akademie"
  status_code = 301
}
