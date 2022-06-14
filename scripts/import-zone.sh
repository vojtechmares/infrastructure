#!/usr/bin/env bash

[ $# -ne 2 ] && echo "\n\033[0;31m[ERROR] Exactly two arguments must be supplied.\n\n\033[1;33m./import-zone.sh <module name> <zone id>\n" && exit 1

MODULE_NAME=$1
ZONE_ID=$2

terraform import module.${MODULE_NAME}.cloudflare_zone.zone ${ZONE_ID}
terrafrom import module.${MODULE_NAME}.cloudflare_zone_dnssec.dnssec ${ZONE_ID}
