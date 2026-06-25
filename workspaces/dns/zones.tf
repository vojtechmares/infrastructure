# Cloudflare provider v5: account is a nested object, zone -> name.
# DNSSEC and per-zone settings live next to each zone.

resource "cloudflare_zone" "mares_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "mares.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "mares_cz_always_use_https" {
  zone_id    = cloudflare_zone.mares_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "mares_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.mares_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "mares_cz_ssl" {
  zone_id    = cloudflare_zone.mares_cz.id
  setting_id = "ssl"
  value      = "strict"
}

resource "cloudflare_zone" "vxm_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "vxm.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "vxm_cz" {
  zone_id = cloudflare_zone.vxm_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "vxm_cz_always_use_https" {
  zone_id    = cloudflare_zone.vxm_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "vxm_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.vxm_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "vxm_cz_ssl" {
  zone_id    = cloudflare_zone.vxm_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "mareshq_com" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "mareshq.com"
  type = "full"
}

resource "cloudflare_zone_dnssec" "mareshq_com" {
  zone_id = cloudflare_zone.mareshq_com.id
  status  = "active"
}

resource "cloudflare_zone_setting" "mareshq_com_always_use_https" {
  zone_id    = cloudflare_zone.mareshq_com.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "mareshq_com_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.mareshq_com.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "mareshq_com_ssl" {
  zone_id    = cloudflare_zone.mareshq_com.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "maresdemo_com" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "maresdemo.com"
  type = "full"
}

resource "cloudflare_zone_dnssec" "maresdemo_com" {
  zone_id = cloudflare_zone.maresdemo_com.id
  status  = "active"
}

resource "cloudflare_zone_setting" "maresdemo_com_always_use_https" {
  zone_id    = cloudflare_zone.maresdemo_com.id
  setting_id = "always_use_https"
  value      = "off"
}

resource "cloudflare_zone_setting" "maresdemo_com_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.maresdemo_com.id
  setting_id = "automatic_https_rewrites"
  value      = "off"
}

resource "cloudflare_zone_setting" "maresdemo_com_ssl" {
  zone_id    = cloudflare_zone.maresdemo_com.id
  setting_id = "ssl"
  value      = "full"
}

# Training microsites

resource "cloudflare_zone" "devops_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "devops-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "devops_skoleni_cz" {
  zone_id = cloudflare_zone.devops_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "devops_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.devops_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "devops_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.devops_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "devops_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.devops_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "argocd_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "argocd-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "argocd_skoleni_cz" {
  zone_id = cloudflare_zone.argocd_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "argocd_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.argocd_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "argocd_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.argocd_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "argocd_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.argocd_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "terraform_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "terraform-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "terraform_skoleni_cz" {
  zone_id = cloudflare_zone.terraform_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "terraform_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.terraform_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "terraform_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.terraform_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "terraform_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.terraform_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "git_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "git-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "git_skoleni_cz" {
  zone_id = cloudflare_zone.git_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "git_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.git_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "git_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.git_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "git_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.git_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "gitlab_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "gitlab-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "gitlab_skoleni_cz" {
  zone_id = cloudflare_zone.gitlab_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "gitlab_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.gitlab_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "gitlab_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.gitlab_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "gitlab_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.gitlab_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "prometheus_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "prometheus-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "prometheus_skoleni_cz" {
  zone_id = cloudflare_zone.prometheus_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "prometheus_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.prometheus_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "prometheus_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.prometheus_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "prometheus_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.prometheus_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "kafka_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "kafka-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "kafka_skoleni_cz" {
  zone_id = cloudflare_zone.kafka_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "kafka_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.kafka_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "kafka_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.kafka_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "kafka_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.kafka_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "golang_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "golang-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "golang_skoleni_cz" {
  zone_id = cloudflare_zone.golang_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "golang_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.golang_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "golang_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.golang_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "golang_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.golang_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "go_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "go-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "go_skoleni_cz" {
  zone_id = cloudflare_zone.go_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "go_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.go_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "go_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.go_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "go_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.go_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "rust_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "rust-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "rust_skoleni_cz" {
  zone_id = cloudflare_zone.rust_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "rust_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.rust_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "rust_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.rust_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "rust_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.rust_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "kubernetes_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "kubernetes-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "kubernetes_skoleni_cz" {
  zone_id = cloudflare_zone.kubernetes_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "kubernetes_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.kubernetes_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "kubernetes_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.kubernetes_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "kubernetes_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.kubernetes_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "k3s_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "k3s-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "k3s_skoleni_cz" {
  zone_id = cloudflare_zone.k3s_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "k3s_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.k3s_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "k3s_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.k3s_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "k3s_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.k3s_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "rke2_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "rke2-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "rke2_skoleni_cz" {
  zone_id = cloudflare_zone.rke2_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "rke2_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.rke2_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "rke2_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.rke2_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "rke2_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.rke2_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "eks_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "eks-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "eks_skoleni_cz" {
  zone_id = cloudflare_zone.eks_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "eks_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.eks_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "eks_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.eks_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "eks_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.eks_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "aks_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "aks-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "aks_skoleni_cz" {
  zone_id = cloudflare_zone.aks_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "aks_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.aks_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "aks_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.aks_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "aks_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.aks_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "gke_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "gke-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "gke_skoleni_cz" {
  zone_id = cloudflare_zone.gke_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "gke_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.gke_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "gke_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.gke_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "gke_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.gke_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "kubeflow_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "kubeflow-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone_dnssec" "kubeflow_skoleni_cz" {
  zone_id = cloudflare_zone.kubeflow_skoleni_cz.id
  status  = "active"
}

resource "cloudflare_zone_setting" "kubeflow_skoleni_cz_always_use_https" {
  zone_id    = cloudflare_zone.kubeflow_skoleni_cz.id
  setting_id = "always_use_https"
  value      = "on"
}

resource "cloudflare_zone_setting" "kubeflow_skoleni_cz_automatic_https_rewrites" {
  zone_id    = cloudflare_zone.kubeflow_skoleni_cz.id
  setting_id = "automatic_https_rewrites"
  value      = "on"
}

resource "cloudflare_zone_setting" "kubeflow_skoleni_cz_ssl" {
  zone_id    = cloudflare_zone.kubeflow_skoleni_cz.id
  setting_id = "ssl"
  value      = "full"
}

resource "cloudflare_zone" "cloudflare_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "cloudflare-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone" "docker_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "docker-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone" "devops_akademie_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "devops-akademie.cz"
  type = "full"
}

resource "cloudflare_zone" "devopsakademie_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "devopsakademie.cz"
  type = "full"
}

resource "cloudflare_zone" "devopsvkapse_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "devopsvkapse.cz"
  type = "full"
}

resource "cloudflare_zone" "maresmail_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "maresmail.cz"
  type = "full"
}

# Parked domains

resource "cloudflare_zone" "github_actions_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "github-actions-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone" "gitlab_ci_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "gitlab-ci-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone" "gopheri_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "gopheri.cz"
  type = "full"
}

resource "cloudflare_zone" "openstack_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "openstack.cz"
  type = "full"
}

resource "cloudflare_zone" "opentelemetry_skoleni_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "opentelemetry-skoleni.cz"
  type = "full"
}

resource "cloudflare_zone" "pid1_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "pid1.cz"
  type = "full"
}

resource "cloudflare_zone" "sportenka_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "sportenka.cz"
  type = "full"
}

resource "cloudflare_zone" "ziglang_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "ziglang.cz"
  type = "full"
}

resource "cloudflare_zone" "zjaponska_cz" {
  account = {
    id = local.cloudflare_account_id
  }
  name = "zjaponska.cz"
  type = "full"
}
