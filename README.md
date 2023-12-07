# Terraform Infrastructure


## Modules

Modules contain Terraform modules with a simple versioning scheme based on sub directories. Only major versions have their own separated sub dirs to ensure backward-compatibility for existing resources yet allowing new ones to be created without the need to migrate everything in one go.

## Workspaces

Terraform workspaces, each with own state-file.
