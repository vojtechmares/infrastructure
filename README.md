# Infrastructure

## Terraform

### Modules

Modules contain Terraform modules with a simple versioning scheme based on sub directories. Only major versions have their own separated sub dirs to ensure backward-compatibility for existing resources yet allowing new ones to be created without the need to migrate everything in one go.

### Environments

Environments contain general overview, like `mgmt` or `prod`. There is a one more directory level that separates resources for easier manipulation and keeping the state small for fast refreshes.
