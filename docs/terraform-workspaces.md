# Terraform workspaces

The thought behind `workspaces/`.

## Motivation

It could all live in a single state, but the workspaces are split along lines of
concern that have nothing in common from an infrastructure perspective. DNS records
and virtual servers change independently, so a change to one should never have to
plan or risk the other.

Separate states also keep each plan small and limit the blast radius of a bad apply.

## Workspaces

- Cloudflare (`dns`)
- HCloud (`compute`)

## State backend

State lives in a single Cloudflare R2 bucket (S3-compatible backend) with local
execution; each workspace stores its state under `<workspace>/terraform.tfstate`.

State was originally kept in a Terraform Cloud organization (`vojtechmares`) with
remote execution and has since been migrated to R2. The former `terraform-cloud`
workspace, which managed the TFC organization itself, was retired as part of that move.
