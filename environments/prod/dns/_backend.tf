terraform {
  backend "remote" {
    organization = "vojtechmares"

    workspaces {
      name = "cloudflare"
    }
  }
}
