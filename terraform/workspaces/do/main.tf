data "digitalocean_kubernetes_versions" "this" {
  version_prefix = "1.23."
}

resource "digitalocean_kubernetes_cluster" "fox" {
  name         = "fox"
  region       = "fra1"
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.this.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "lynx"
    size       = "s-2vcpu-4gb"
    node_count = 2
  }
}

output "fox_kubeconfig" {
  value     = digitalocean_kubernetes_cluster.fox.kube_config.0.raw_config
  sensitive = true
}
