# Contribution guide

a.k.a how to contribute :)

## Commit message format

[Conventional Commits v1](https://www.conventionalcommits.org/en/v1.0.0/#specification) with [Angular Conventions](https://github.com/angular/angular/blob/22b96b9/CONTRIBUTING.md#-commit-message-guidelines)


```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Terraform

- Always use terraform formatter (`terraform fmt -recursive`).
- Use pre-commit hooks so you don't commit non formatted code (`make setup-git-hooks && make tf-fmt`)
- If you have committed and pushed misformatted code. Use commit type `style` to fix it

### Modules

Modules should not be created as a part of this repository since modules are inside GitLab subgroup ([MaresHQ / Terraform Modules](https://gitlab.mareshq.com/mareshq/terraform-modules)) with each module having it's own repository.

#### Why

Modules are not stored as a part of this repository, because when using Terraform Cloud and modules are sourced with `../` path (they would be in `terraform/modules`) is not working.
I am using [GitLab's Infrastructure Registry (Terraform Module Registry)](https://gitlab.mareshq.com/help/user/packages/terraform_module_registry/index.md).


Yes, this makes this GitLab instance a single point of failure, I may migrate it in the future back to monorepo. But I wanted to try the module registry and [`semantic-release`](https://semantic-release.gitbook.io/semantic-release/) tool.

### Workspaces

Workspaces contain environment (app) specific code and acts as a "glue" to modules.

Should have elastic IP here, since with modules they may change too often and since it's manual task to add it to firewall, we should not change it often.

Good idea / practice is to have an EIP per environment (Kubernetes cluster?).

## Docs

When committing any changes to `docs/`. Use commit type `docs`.

Also use commit type `docs`, when changing `CONTRIBUTING.md` and any `README.md`.
