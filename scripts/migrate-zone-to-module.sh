#!/usr/bin/env bash

# Terraform resource name, e.g.: flakame_se
NAME=$1

echo ""
echo "MOVING ${NAME}"
echo ""

terraform state mv cloudflare_zone.${NAME} module.${NAME}.cloudflare_zone.zone
terraform state mv cloudflare_zone_dnssec.${NAME} module.${NAME}.cloudflare_zone_dnssec.dnssec
terraform state mv cloudflare_zone_settings_override.${NAME} module.${NAME}.cloudflare_zone_settings_override.settings_override

echo ""
echo "MOVE SUCCESSFUL"
echo ""
