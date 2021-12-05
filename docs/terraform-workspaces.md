# Terraform Workspaces

The thought behind `terraform/workspaces`.

## Motivation

> Yes, it all could be part of a single state, but I wanted to try Terraform Cloud and separate some things from another.

Great example of the workspaces separation is GitLab and Hetzner Cloud infrastructure.

GitLab workspace focuses only on user, project, group, etc. management and does not care if some virtual server exists or not. And HCloud does not care about GitLab. Yes, they will talk to each other when deploying an application... but from the infrastructure perspective they have nothing common.

Only thing, that may change this would be Kubernetes (it's GitLab integration) and provisioning of a cluster on HCloud. In that case, the cluster registration to GitLab is IMHO responsibility of HCloud workspace.

I also wanted to try out Terraform Cloud and organization management in Terraform, so I wanted more than a single workspace.

## Workspaces

`terraform/workspaces` directly mirrors Terraform Cloud's workspaces.

- Cloudflare
- GitLab
- HCloud
- Terraform Cloud

## Terraform Cloud

Everything is under single Terraform Cloud organization [`vojtechmares`](https://app.terraform.io/app/vojtechmares).
