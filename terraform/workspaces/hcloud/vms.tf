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

output "alder_ip" {
  value = {
    ipv4 = hcloud_server.alder.ipv4_address,
    ipv6 = hcloud_server.alder.ipv6_address,
  }
}
