resource "hcloud_server" "gitlab" {
  name        = "gitlab"
  image       = "ubuntu-20.04"
  server_type = "cpx31"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
  user_data   = file("files/docker.cloud-config.yml")

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      user_data
    ]
  }
}

resource "hcloud_volume" "gitlab_registry" {
  name     = "gitlab-registry"
  location = "fsn1"
  size     = 100
  format   = "ext4"
}

resource "hcloud_volume_attachment" "gitlab_registry" {
  volume_id = hcloud_volume.gitlab_registry.id
  server_id = hcloud_server.gitlab.id
  automount = true
}

resource "cloudflare_record" "buffalo_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "buffalo"
  value   = hcloud_server.gitlab.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "buffalo_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "buffalo"
  value   = hcloud_server.gitlab.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "gitlab_ip" {
  value = {
    ipv4 = hcloud_server.gitlab.ipv4_address,
    ipv6 = hcloud_server.gitlab.ipv6_address,
  }
}

resource "hcloud_server" "gitlab_micro_runner" {
  name        = "gitlab-runner-micro"
  image       = "ubuntu-20.04"
  server_type = "cpx11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = false
  user_data   = file("files/docker.cloud-config.yml")

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

resource "cloudflare_record" "catalpa_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "catalpa"
  value   = hcloud_server.gitlab_micro_runner.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "catalpa_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "catalpa"
  value   = hcloud_server.gitlab_micro_runner.ipv6_address
  type    = "AAAA"
  proxied = false
}

# panel.flakame.se
resource "hcloud_server" "alder" {
  name        = "alder"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
}

resource "cloudflare_record" "alder_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "alder"
  value   = hcloud_server.alder.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "alder_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "alder"
  value   = hcloud_server.alder.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "alder_ip" {
  value = {
    ipv4 = hcloud_server.alder.ipv4_address,
    ipv6 = hcloud_server.alder.ipv6_address,
  }
}

resource "hcloud_server" "db" {
  name        = "db"
  image       = "67794396" // Ubuntu 22.04 for x86
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true

  labels = {
    "db" = "true"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_record" "db_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "db"
  value   = hcloud_server.db.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "db_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "db"
  value   = hcloud_server.db.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "db_ip" {
  value = {
    ipv4 = hcloud_server.db.ipv4_address,
    ipv6 = hcloud_server.db.ipv6_address,
  }
}

resource "hcloud_server" "kiwi_k8s_nodes" {
  count = 1

  name        = "kiwi-k8s-node-${count.index}"
  image       = "67794396" // Ubuntu 22.04 for x86
  server_type = "cpx31"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true

  labels = {
    "k8s"         = "true"
    "k8s/cluster" = "kiwi"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_record" "kiwi_k8s_vxm_cz" {
  count = length(hcloud_server.kiwi_k8s_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "node-${count.index}.kiwi.k8s"
  value   = hcloud_server.kiwi_k8s_nodes[count.index].ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "kiwi_k8s_vxm_cz_v6" {
  count = length(hcloud_server.kiwi_k8s_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "node-${count.index}.kiwi.k8s"
  value   = hcloud_server.kiwi_k8s_nodes[count.index].ipv6_address
  type    = "AAAA"
  proxied = false
}

output "kiwi_k8s_node_ip" {
  value = {
    ipv4 = hcloud_server.kiwi_k8s_nodes.*.ipv4_address,
    ipv6 = hcloud_server.kiwi_k8s_nodes.*.ipv6_address,
  }
}
