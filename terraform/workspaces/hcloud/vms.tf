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
  backups     = true
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

resource "hcloud_server" "sentry" {
  name        = "sentry"
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

resource "cloudflare_record" "opossum_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "opossum"
  value   = hcloud_server.sentry.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "opossum_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "opossum"
  value   = hcloud_server.sentry.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "sentry_ip" {
  value = {
    ipv4 = hcloud_server.sentry.ipv4_address,
    ipv6 = hcloud_server.sentry.ipv6_address,
  }
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

resource "hcloud_server" "rowan" {
  name        = "rowan"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
  user_data   = file("files/docker.cloud-config.yml")

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

resource "cloudflare_record" "rowan_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "rowan"
  value   = hcloud_server.rowan.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "rowan_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "rowan"
  value   = hcloud_server.rowan.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "rowan_ip" {
  value = {
    ipv4 = hcloud_server.rowan.ipv4_address,
    ipv6 = hcloud_server.rowan.ipv6_address,
  }
}

resource "hcloud_server" "aspen" {
  name        = "aspen"
  image       = "ubuntu-20.04"
  server_type = "cx11"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
  user_data   = file("files/docker.cloud-config.yml")

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

resource "cloudflare_record" "aspen_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "aspen"
  value   = hcloud_server.aspen.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "aspen_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "aspen"
  value   = hcloud_server.aspen.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "aspen_ip" {
  value = {
    ipv4 = hcloud_server.aspen.ipv4_address,
    ipv6 = hcloud_server.aspen.ipv6_address,
  }
}

resource "hcloud_server" "willow" {
  name        = "willow"
  image       = "ubuntu-20.04"
  server_type = "cx21"
  location    = "fsn1"
  ssh_keys    = [hcloud_ssh_key.vojtechmares.name]
  backups     = true
  user_data   = file("files/docker.cloud-config.yml")

  lifecycle {
    ignore_changes = [
      user_data
    ]
  }
}

resource "cloudflare_record" "willow_vxm_cz" {
  zone_id = local.vxm_cz_zone_id
  name    = "willow"
  value   = hcloud_server.willow.ipv4_address
  type    = "A"
  proxied = false
}

resource "cloudflare_record" "willow_vxm_cz_v6" {
  zone_id = local.vxm_cz_zone_id
  name    = "willow"
  value   = hcloud_server.willow.ipv6_address
  type    = "AAAA"
  proxied = false
}

output "willow_ip" {
  value = {
    ipv4 = hcloud_server.willow.ipv4_address,
    ipv6 = hcloud_server.willow.ipv6_address,
  }
}
