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
  content = hcloud_server.gitlab.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "buffalo_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "buffalo"
  content = hcloud_server.gitlab.ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "hcloud_server" "gitlab_runner_amd64" {
  name        = "gitlab-runner"
  image       = "ubuntu-20.04"
  server_type = "cx32"
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

resource "cloudflare_record" "gitlab_runner_amd64_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "gitlab-runner"
  content = hcloud_server.gitlab_runner_amd64.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "gitlab_runner_amd64_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "gitlab-runner"
  content = hcloud_server.gitlab_runner_amd64.ipv6_address
  type    = "AAAA"
  proxied = false
}

resource "hcloud_server" "valhalla" {
  name        = "valhalla"
  image       = "rocky-9"
  server_type = "cx32"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
}

resource "cloudflare_record" "valhalla_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "valhalla"
  content = hcloud_server.valhalla.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "valhalla_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "valhalla"
  content = hcloud_server.valhalla.ipv6_address
  type    = "AAAA"
  proxied = false
}
