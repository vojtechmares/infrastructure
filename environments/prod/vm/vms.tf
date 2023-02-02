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

resource "hcloud_server" "controlplane_bee" {
  name        = "controlplane-bee-k8s"
  image       = "ubuntu-22.04"
  server_type = "cx21"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
}

resource "cloudflare_record" "controlplane_bee" {
  zone_id = local.vxm_cz_zone_id
  name    = "bee"
  value   = hcloud_server.controlplane_bee.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "controlplane_bee_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "bee"
  value   = hcloud_server.controlplane_bee.ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "cloudflare_record" "controlplane_bee_k8s" {
  zone_id = local.vxm_cz_zone_id
  name    = "controlplane.bee.k8s"
  value   = cloudflare_record.controlplane_bee.hostname
  type    = "CNAME"
  proxied = false
}

output "controlplane_bee_ip" {
  value = {
    ipv4 = hcloud_server.controlplane_bee.ipv4_address,
    ipv6 = hcloud_server.controlplane_bee.ipv6_address,
  }
}

resource "hcloud_server" "nodes_bee_k8s" {
  count = 3

  name        = "node-${count.index}-bee-k8s"
  image       = "ubuntu-22.04"
  server_type = "cx41"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
}

resource "cloudflare_record" "nodes_bee_k8s" {
  count = length(hcloud_server.nodes_bee_k8s)

  zone_id = local.vxm_cz_zone_id
  name    = "node${count.index}.bee"
  value   = hcloud_server.nodes_bee_k8s[count.index].ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "nodes_bee_k8s_v6" {
  count = length(hcloud_server.nodes_bee_k8s)

  zone_id = local.vxm_cz_zone_id
  name    = "node${count.index}.bee"
  value   = hcloud_server.nodes_bee_k8s[count.index].ipv6_address
  type    = "AAAA"
  proxied = false
}

output "nodes_bee_k8s_ip" {
  value = { for idx, node in hcloud_server.nodes_bee_k8s : idx => {
    ipv4 = node.ipv4_address,
    ipv6 = node.ipv6_address,
  } }
}
