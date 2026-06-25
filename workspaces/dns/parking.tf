module "aks_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.aks_skoleni_cz.id
}

module "argocd_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.argocd_skoleni_cz.id
}

module "devops_akademie_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.devops_akademie_cz.id
}

module "devops_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.devops_skoleni_cz.id
}

module "devopsakademie_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.devopsakademie_cz.id
}

module "eks_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.eks_skoleni_cz.id
}

module "git_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.git_skoleni_cz.id
}

module "github_actions_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.github_actions_skoleni_cz.id
}

module "gitlab_ci_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.gitlab_ci_skoleni_cz.id
}

module "gitlab_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.gitlab_skoleni_cz.id
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

module "kubernetes_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.kubernetes_skoleni_cz.id
}

module "openstack_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.openstack_cz.id
}

module "opentelemetry_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.opentelemetry_skoleni_cz.id
}

module "pid1_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.pid1_cz.id
}

module "prometheus_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.prometheus_skoleni_cz.id
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

module "terraform_skoleni_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.terraform_skoleni_cz.id
}

module "ziglang_cz_parking" {
  source  = "../../modules/domain-parking/v1"
  zone_id = cloudflare_zone.ziglang_cz.id
}
