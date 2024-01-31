module "vxm_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.vxm_cz.id
}

module "vojtechmares_dev_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.vojtechmares_dev.id
}

module "maresdemo_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.maresdemo_com.id
}

module "vojtechmares_blog_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.vojtechmares_blog.id
}

module "stepanka_net_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.stepanka_net.id
}

module "devops_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.devops_skoleni_cz.id
}

module "argocd_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.argocd_skoleni_cz.id
}

module "terraform_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.terraform_skoleni_cz.id
}

module "git_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.git_skoleni_cz.id
}

module "gitlab_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.gitlab_skoleni_cz.id
}

module "prometheus_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.prometheus_skoleni_cz.id
}

module "kafka_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.kafka_skoleni_cz.id
}

module "golang_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.golang_skoleni_cz.id
}

module "go_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.go_skoleni_cz.id
}

module "rust_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.rust_skoleni_cz.id
}

module "kubernetes_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.kubernetes_skoleni_cz.id
}

module "k3s_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.k3s_skoleni_cz.id
}

module "rke2_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.rke2_skoleni_cz.id
}

module "eks_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.eks_skoleni_cz.id
}

module "aks_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.aks_skoleni_cz.id
}

module "gke_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.gke_skoleni_cz.id
}

module "kubeflow_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = cloudflare_zone.kubeflow_skoleni_cz.id
}
