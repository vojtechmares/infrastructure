module "devopsvkapse_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.devopsvkapse_cz.id
}

module "eks_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.eks_skoleni_cz.id
}

module "gke_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.gke_skoleni_cz.id
}

module "go_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.go_skoleni_cz.id
}

module "golang_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.golang_skoleni_cz.id
}

module "gopheri_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.gopheri_cz.id
}

module "k3s_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.k3s_skoleni_cz.id
}

module "kafka_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.kafka_skoleni_cz.id
}

module "kubeflow_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.kubeflow_skoleni_cz.id
}

module "openstack_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.openstack_cz.id
}

module "pid1_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.pid1_cz.id
}

module "rke2_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.rke2_skoleni_cz.id
}

module "rust_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.rust_skoleni_cz.id
}

module "sportenka_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.sportenka_cz.id
}

module "ziglang_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.ziglang_cz.id
}

module "zjaponska_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.zjaponska_cz.id
}
