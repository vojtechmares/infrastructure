#!/usr/bin/env bash

# Terraform resource name, e.g.: flakame_se
NAME=$1

echo ""
echo "MOVING ${NAME}"
echo ""

terraform state mv gitlab_project.${NAME} module.${NAME}.gitlab_project.project
terraform state mv gitlab_branch_protection.${NAME} module.${NAME}.gitlab_branch_protection.default_branch_protection

echo ""
echo "MOVE SUCCESSFUL"
echo ""
