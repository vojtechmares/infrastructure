.PHONY: setup-git-hooks
setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

.PHONY: tf-fmt-check
tf-fmt-check:
	terraform fmt -recursive -check

.PHONY: tf-fmt
tf-fmt:
	terraform fmt -recursive
