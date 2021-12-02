# Terraform version constraints

This is a short summary of Terraform best practices on version constraints.


Official Terraform documentation:
- [Provider Requirements](https://www.terraform.io/docs/language/settings/index.html#specifying-provider-requirements)
- [Version Constraints](https://www.terraform.io/docs/language/expressions/version-constraints.html)

## Workspaces (root modules)

Providers and third-party modules should always use constraint `~>`.

For example: `~>1.0.3` would allow `1.0.4`, `1.0.17`, but not `1.1.0` or `1.0.1`.

## Modules (root submodule)

Our modules should not be that restrictive and should use `>=` constraint.

I also recommend adding `, <` against next major version which is expected to have BC breaks.

Fro example: `>=2.14.0, <3.0.0`.
