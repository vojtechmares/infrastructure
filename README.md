# Terraform Infrastructure

## Modules

Modules contain Terraform modules with a simple versioning scheme based on sub directories. Only major versions have their own separated sub dirs to ensure backward-compatibility for existing resources yet allowing new ones to be created without the need to migrate everything in one go.

## Workspaces

Terraform workspaces, each with own state-file.

## State backend

State lives in a single Cloudflare R2 bucket (S3-compatible), one key per workspace
(`<workspace>/terraform.tfstate`). Execution is local, with backend and provider
credentials loaded from environment variables.

Locking uses the S3 backend's native `use_lockfile` (Terraform 1.10+); no DynamoDB is
required.

## Local setup

Credentials are loaded per directory with [direnv](https://direnv.net):

1. Copy the repo-root `.envrc.example` to `.envrc` and fill in the Cloudflare R2 backend
   credentials (shared by every workspace).
2. In each workspace under `workspaces/`, copy `.envrc.example` to `.envrc` and fill in that
   workspace's provider credentials. These inherit the root `.envrc` via `source_up`.
3. Run `direnv allow` in each directory.

The real `.envrc` files are gitignored; only the `.envrc.example` templates are committed.
