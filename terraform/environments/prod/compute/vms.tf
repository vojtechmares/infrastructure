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

resource "hcloud_server" "postgres" {
  name        = "postgres"
  image       = "rocky-9"
  server_type = "cax11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true

  labels = {
    "arch" = "arm64"
  }

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "cloudflare_record" "postgres_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "postgres"
  value   = hcloud_server.postgres.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "postgres_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "postgres"
  value   = hcloud_server.postgres.ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "hcloud_server" "bastion" {
  name        = "bastion"
  image       = "rocky-9"
  server_type = "cax11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]

  labels = {
    "arch" = "arm64"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_record" "bastion_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "bastion"
  value   = hcloud_server.bastion.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "bastion_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "bastion"
  value   = hcloud_server.bastion.ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "hcloud_server" "k8s_cherry_nodes" {
  count = 3

  name        = "cherry-${count.index}"
  image       = "rocky-9"
  server_type = "cax21"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]

  labels = {
    "arch"        = "arm64"
    "k8s"         = "true"
    "k8s/cluster" = "cherry"
    "env"         = "production"
  }
}

resource "cloudflare_record" "cherry_nodes_k8s_vxm_cz" {
  count = length(hcloud_server.k8s_cherry_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "cherry-${count.index}.k8s"
  value   = hcloud_server.k8s_cherry_nodes[count.index].ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "cherry_nodes_k8s_vxm_cz_v6" {
  count = length(hcloud_server.k8s_cherry_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "cherry-${count.index}.k8s"
  value   = hcloud_server.k8s_cherry_nodes[count.index].ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "hcloud_server" "k8s_lychee_nodes" {
  count = 2

  name        = "lychee-${count.index}"
  image       = "rocky-9"
  server_type = "cpx31"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]

  labels = {
    "arch"        = "amd64"
    "k8s"         = "true"
    "k8s/cluster" = "lychee"
    "env"         = "production"
  }
}

resource "cloudflare_record" "lychee_nodes_k8s_vxm_cz" {
  count = length(hcloud_server.k8s_lychee_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "lychee-${count.index}.k8s"
  value   = hcloud_server.k8s_lychee_nodes[count.index].ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "lychee_nodes_k8s_vxm_cz_v6" {
  count = length(hcloud_server.k8s_lychee_nodes)

  zone_id = local.vxm_cz_zone_id
  name    = "lychee-${count.index}.k8s"
  value   = hcloud_server.k8s_lychee_nodes[count.index].ipv6_address
  type    = "AAAA"
  proxied = false
}
