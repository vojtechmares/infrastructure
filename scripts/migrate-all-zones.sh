#!/usr/bin/env bash

while read p; do
  NAME=$p
  echo "Moving $NAME..."
  terraform state mv module.${NAME}.cloudflare_zone.zone cloudflare_zone.${NAME}
  terraform state mv module.${NAME}.cloudflare_zone_dnssec.dnssec cloudflare_zone_dnssec.${NAME}
  terraform state mv module.${NAME}.cloudflare_zone_settings_override.settings_override cloudflare_zone_settings_override.${NAME}
  echo "Done."
done < zones.txt
