module "vxm_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vxm_cz.zone.id
}

module "vojtechmares_dev_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vojtechmares_dev.zone.id
}

module "goplaintext_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.goplaintext_com.zone.id
}

module "planette_io_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.planette_io.zone.id
}

module "maresdemo_com_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.maresdemo_com.zone.id
}

module "vojtechmares_blog_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.vojtechmares_blog.zone.id
}

module "stepanka_net_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.stepanka_net.zone.id
}

module "devops_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.devops_skoleni_cz.zone.id
}

module "argocd_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.argocd_skoleni_cz.zone.id
}

module "terraform_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.terraform_skoleni_cz.zone.id
}

module "git_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.git_skoleni_cz.zone.id
}

module "gitlab_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.gitlab_skoleni_cz.zone.id
}

module "prometheus_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.prometheus_skoleni_cz.zone.id
}

module "kafka_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.kafka_skoleni_cz.zone.id
}

module "golang_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.golang_skoleni_cz.zone.id
}

module "go_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.go_skoleni_cz.zone.id
}

module "rust_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.rust_skoleni_cz.zone.id
}

module "dockerskoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.dockerskoleni_cz.zone.id
}

module "kubernetes_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.kubernetes_skoleni_cz.zone.id
}

module "k3s_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.k3s_skoleni_cz.zone.id
}

module "rke2_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.rke2_skoleni_cz.zone.id
}

module "eks_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.eks_skoleni_cz.zone.id
}

module "aks_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.aks_skoleni_cz.zone.id
}

module "gke_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.gke_skoleni_cz.zone.id
}

module "rancher_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.rancher_skoleni_cz.zone.id
}

module "kubeflow_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.kubeflow_skoleni_cz.zone.id
}

module "argorollouts_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.argorollouts_skoleni_cz.zone.id
}

module "argoworkflows_skoleni_cz_no_mail" {
  source  = "vojtechmares/no-mail/cloudflare"
  version = "1.0.0"
  zone_id = module.argoworkflows_skoleni_cz.zone.id
}
