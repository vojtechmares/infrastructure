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

## Modules

Modules are located within `modules/` directory. Since the code base in monorepo, use directories to separate major versions like `v1`, `v2` etc. Example: `modules/cloudflare-zone/v1` with a breaking changes or just big changes, moves to `modules/cloudflare-zone/v2`.

## Workspaces

Workspaces contain environment (app) specific code and acts as a "glue" to modules.

Should have elastic IP here, since with modules they may change too often and since it's manual task to add it to firewall, we should not change it often.

Good idea / practice is to have an EIP per environment (Kubernetes cluster?).

## Docs

When committing any changes to `docs/`. Use commit type `docs`.

Also use commit type `docs`, when changing `CONTRIBUTING.md` and any `README.md`.
