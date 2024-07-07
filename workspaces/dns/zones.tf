resource "cloudflare_zone" "mares_cz" {
  account_id = local.cloudflare_account_id
  zone       = "mares.cz"
}

resource "cloudflare_zone_dnssec" "mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
}

resource "cloudflare_zone_settings_override" "mares_cz" {
  zone_id = cloudflare_zone.mares_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "vxm_cz" {
  account_id = local.cloudflare_account_id
  zone       = "vxm.cz"
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

resource "cloudflare_zone" "mareshq_com" {
  account_id = local.cloudflare_account_id
  zone       = "mareshq.com"
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
#   account_id = local.cloudflare_account_id
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

resource "cloudflare_zone" "vojtechmares_dev" {
  account_id = local.cloudflare_account_id
  zone       = "vojtechmares.dev"
}

resource "cloudflare_zone_dnssec" "vojtechmares_dev" {
  zone_id = cloudflare_zone.vojtechmares_dev.id
}

resource "cloudflare_zone_settings_override" "vojtechmares_dev" {
  zone_id = cloudflare_zone.vojtechmares_dev.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "acaslab_com" {
  account_id = local.cloudflare_account_id
  zone       = "acaslab.com"
}

resource "cloudflare_zone_dnssec" "acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
}

resource "cloudflare_zone_settings_override" "acaslab_com" {
  zone_id = cloudflare_zone.acaslab_com.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "vojtechmares_blog" {
  account_id = local.cloudflare_account_id
  zone       = "vojtechmares.blog"
}

resource "cloudflare_zone_dnssec" "vojtechmares_blog" {
  zone_id = cloudflare_zone.vojtechmares_blog.id
}

resource "cloudflare_zone_settings_override" "vojtechmares_blog" {
  zone_id = cloudflare_zone.vojtechmares_blog.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "maresdemo_com" {
  account_id = local.cloudflare_account_id
  zone       = "maresdemo.com"
}

resource "cloudflare_zone_dnssec" "maresdemo_com" {
  zone_id = cloudflare_zone.maresdemo_com.id
}

resource "cloudflare_zone_settings_override" "maresdemo_com" {
  zone_id = cloudflare_zone.maresdemo_com.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "vmpkg_com" {
  account_id = local.cloudflare_account_id
  zone       = "vmpkg.com"
}

resource "cloudflare_zone_dnssec" "vmpkg_com" {
  zone_id = cloudflare_zone.vmpkg_com.id
}

resource "cloudflare_zone_settings_override" "vmpkg_com" {
  zone_id = cloudflare_zone.vmpkg_com.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

# Training microsites

resource "cloudflare_zone" "devops_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "devops-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "devops_skoleni_cz" {
  zone_id = cloudflare_zone.devops_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "devops_skoleni_cz" {
  zone_id = cloudflare_zone.devops_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "argocd_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "argocd-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "argocd_skoleni_cz" {
  zone_id = cloudflare_zone.argocd_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "argocd_skoleni_cz" {
  zone_id = cloudflare_zone.argocd_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "terraform_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "terraform-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "terraform_skoleni_cz" {
  zone_id = cloudflare_zone.terraform_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "terraform_skoleni_cz" {
  zone_id = cloudflare_zone.terraform_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "git_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "git-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "git_skoleni_cz" {
  zone_id = cloudflare_zone.git_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "git_skoleni_cz" {
  zone_id = cloudflare_zone.git_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "gitlab_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "gitlab-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "gitlab_skoleni_cz" {
  zone_id = cloudflare_zone.gitlab_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "gitlab_skoleni_cz" {
  zone_id = cloudflare_zone.gitlab_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "prometheus_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "prometheus-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "prometheus_skoleni_cz" {
  zone_id = cloudflare_zone.prometheus_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "prometheus_skoleni_cz" {
  zone_id = cloudflare_zone.prometheus_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}


resource "cloudflare_zone" "kafka_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "kafka-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "kafka_skoleni_cz" {
  zone_id = cloudflare_zone.kafka_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "kafka_skoleni_cz" {
  zone_id = cloudflare_zone.kafka_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "golang_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "golang-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "golang_skoleni_cz" {
  zone_id = cloudflare_zone.golang_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "golang_skoleni_cz" {
  zone_id = cloudflare_zone.golang_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "go_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "go-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "go_skoleni_cz" {
  zone_id = cloudflare_zone.go_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "go_skoleni_cz" {
  zone_id = cloudflare_zone.go_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "rust_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "rust-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "rust_skoleni_cz" {
  zone_id = cloudflare_zone.rust_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "rust_skoleni_cz" {
  zone_id = cloudflare_zone.rust_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "kubernetes_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "kubernetes-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "kubernetes_skoleni_cz" {
  zone_id = cloudflare_zone.kubernetes_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "kubernetes_skoleni_cz" {
  zone_id = cloudflare_zone.kubernetes_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "k3s_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "k3s-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "k3s_skoleni_cz" {
  zone_id = cloudflare_zone.k3s_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "k3s_skoleni_cz" {
  zone_id = cloudflare_zone.k3s_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "rke2_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "rke2-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "rke2_skoleni_cz" {
  zone_id = cloudflare_zone.rke2_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "rke2_skoleni_cz" {
  zone_id = cloudflare_zone.rke2_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "eks_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "eks-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "eks_skoleni_cz" {
  zone_id = cloudflare_zone.eks_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "eks_skoleni_cz" {
  zone_id = cloudflare_zone.eks_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "aks_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "aks-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "aks_skoleni_cz" {
  zone_id = cloudflare_zone.aks_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "aks_skoleni_cz" {
  zone_id = cloudflare_zone.aks_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "gke_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "gke-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "gke_skoleni_cz" {
  zone_id = cloudflare_zone.gke_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "gke_skoleni_cz" {
  zone_id = cloudflare_zone.gke_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "kubeflow_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "kubeflow-skoleni.cz"
}

resource "cloudflare_zone_dnssec" "kubeflow_skoleni_cz" {
  zone_id = cloudflare_zone.kubeflow_skoleni_cz.id
}

resource "cloudflare_zone_settings_override" "kubeflow_skoleni_cz" {
  zone_id = cloudflare_zone.kubeflow_skoleni_cz.id
  settings {
    always_use_https         = "on"
    automatic_https_rewrites = "on"
    ssl                      = "full"
  }
}

resource "cloudflare_zone" "cloudflare_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "cloudflare-skoleni.cz"
}

resource "cloudflare_zone" "zig_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "zig-skoleni.cz"
}

resource "cloudflare_zone" "docker_skoleni_cz" {
  account_id = local.cloudflare_account_id
  zone       = "docker-skoleni.cz"
}

resource "cloudflare_zone" "devops_akademie_cz" {
  account_id = local.cloudflare_account_id
  zone       = "devops-akademie.cz"
}

resource "cloudflare_zone" "devopsakademie_cz" {
  account_id = local.cloudflare_account_id
  zone       = "devopsakademie.cz"
}

resource "cloudflare_zone" "devopsvkapse_cz" {
  account_id = local.cloudflare_account_id
  zone       = "devopsvkapse.cz"
}

resource "cloudflare_zone" "maresmail_cz" {
  account_id = local.cloudflare_account_id
  zone       = "maresmail.cz"
}

resource "cloudflare_zone" "vmdevel_cz" {
  account_id = local.cloudflare_account_id
  zone       = "vmdevel.cz"
}
