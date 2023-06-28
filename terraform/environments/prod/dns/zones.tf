module "vxm_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "vxm.cz"
}

module "mareshq_com" {
  source = "./../../../modules/cloudflare-zone/v1"

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

module "vojtechmares_dev" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "vojtechmares.dev"
}

module "goplaintext_com" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "goplaintext.com"
}

module "acaslab_com" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "acaslab.com"
}

module "vojtechmares_blog" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "vojtechmares.blog"
}

module "maresdemo_com" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "maresdemo.com"
}

module "planette_io" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "planette.io"
}

module "stepanka_net" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "stepanka.net"
}

module "vmpkg_com" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "vmpkg.com"
}

# Training microsites

module "devops_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "devops-skoleni.cz"
}

module "argocd_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "argocd-skoleni.cz"
}

module "terraform_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "terraform-skoleni.cz"
}

module "git_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "git-skoleni.cz"
}

module "gitlab_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "gitlab-skoleni.cz"
}

module "prometheus_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "prometheus-skoleni.cz"
}

module "kafka_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "kafka-skoleni.cz"
}

module "golang_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "golang-skoleni.cz"
}

module "go_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "go-skoleni.cz"
}

module "rust_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "rust-skoleni.cz"
}

module "dockerskoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "dockerskoleni.cz"
}

module "kubernetes_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "kubernetes-skoleni.cz"
}

module "k3s_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "k3s-skoleni.cz"
}

module "rke2_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "rke2-skoleni.cz"
}

module "eks_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "eks-skoleni.cz"
}

module "aks_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "aks-skoleni.cz"
}

module "gke_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "gke-skoleni.cz"
}

module "rancher_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "rancher-skoleni.cz"
}

module "argorollouts_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "argorollouts-skoleni.cz"
}

module "argoworkflows_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "argoworkflows-skoleni.cz"
}

module "kubeflow_skoleni_cz" {
  source = "./../../../modules/cloudflare-zone/v1"

  zone = "kubeflow-skoleni.cz"
}
