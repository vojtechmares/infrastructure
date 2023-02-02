# Infra

## Directory structure

### Modules

Modules contain Terraform modules with a simple versioning scheme based on sub directories. Only major versions have their own separated sub dirs to ensure backward-compatibility for existing resources yet allowing new ones to be created without the need to migrate everything in one go.

### Environments

Environments contain general overview, like `mgmt` or `prod`. There is a one more directory level that separates resources for easier manipulation and keeping the state small for fast refreshes.

### Workspaces

This a legacy directory structure which grouped resources by main provider which over time did not prove as a good choice. Some resources require more providers (for example AWS SES needs to verify the domain which requires both **AWS** and **Cloudflare** providers).

Therefore I have started migration from that structure to a new one outlined in my [Terraform Template](https://github.com/vojtechmares/terraform-template) repository.
