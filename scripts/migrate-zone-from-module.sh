#!/usr/bin/env bash

# Terraform resource name, e.g.: flakame_se
NAME=$1

echo ""
echo "MOVING ${NAME}"
echo ""

terraform state mv module.${NAME}.cloudflare_zone.zone cloudflare_zone.${NAME}
terraform state mv module.${NAME}.cloudflare_zone_dnssec.dnssec cloudflare_zone_dnssec.${NAME}
terraform state mv module.${NAME}.cloudflare_zone_settings_override.settings_override cloudflare_zone_settings_override.${NAME}

echo ""
echo "MOVE SUCCESSFUL"
echo ""
