setup-git-hooks:
	rm -rf .git/hooks
	(cd .git && ln -s ../.git-hooks hooks)

tf-fmt-check:
	terraform fmt -recursive -check

tf-fmt:
	terraform fmt -recursive
