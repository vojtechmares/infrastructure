# Terraform Workspaces

The thought behind `terraform/workspaces`.

## Motivation

> Yes, it all could be part of a single state, but I wanted to try Terraform Cloud and separate some things from another.

Great example of the workspaces separation is GitLab and Hetzner Cloud infrastructure.

GitLab workspace focuses only on user, project, group, etc. management and does not care if some virtual server exists or not. And HCloud does not care about GitLab. Yes, they will talk to each other when deploying an application... but from the infrastructure perspective they have nothing common.

Only thing, that may change this would be Kubernetes (it's GitLab integration) and provisioning of a cluster on HCloud. In that case, the cluster registration to GitLab is IMHO responsibility of HCloud workspace.

I also wanted to try out Terraform Cloud and organization management in Terraform, so I wanted more than a single workspace.

## Workspaces

- Cloudflare (`dns`)
- HCloud (`compute`)
- AWS backup storage (`backup-storage`)

## State backend

State was originally kept in a single Terraform Cloud organization (`vojtechmares`) with
remote execution. It has since been migrated to a single Cloudflare R2 bucket (S3-compatible
backend) with local execution; each workspace stores its state under
`<workspace>/terraform.tfstate`. The former `terraform-cloud` workspace (which managed the
TFC organization itself) was retired as part of that move.
